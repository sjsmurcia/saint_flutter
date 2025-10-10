import 'package:drift/drift.dart';

import '../../domain/models/bank_account.dart';
import '../../domain/models/bank_movement.dart';
import '../../domain/repositories/bank_repository.dart';
import '../../domain/repositories/outbox_repository.dart';
import '../local/dao/bank_account_dao.dart';
import '../local/dao/bank_movement_dao.dart';
import '../local/database/app_database.dart';

class BankRepositoryImpl implements BankRepository {
  BankRepositoryImpl(
    this._accountDao,
    this._movementDao,
    this._outboxRepository,
    this._db,
  );

  final BankAccountDao _accountDao;
  final BankMovementDao _movementDao;
  final OutboxRepository _outboxRepository;
  final AppDatabase _db;

  @override
  Stream<List<BankAccount>> watchAccounts(String tenantId) {
    return _accountDao
        .watchByTenant(tenantId)
        .map(
          (rows) => rows
              .map(
                (row) => BankAccount(
                  id: row.id,
                  tenantId: row.tenantId,
                  name: row.name,
                  currency: row.currency,
                  balance: row.balance,
                  updatedAt: row.updatedAt,
                ),
              )
              .toList(),
        );
  }

  @override
  Stream<List<BankMovement>> watchMovements(String accountId) {
    return _movementDao
        .watchByAccount(accountId)
        .map(
          (rows) => rows
              .map(
                (row) => BankMovement(
                  id: row.id,
                  tenantId: row.tenantId,
                  accountId: row.accountId,
                  amount: row.amount,
                  type: row.type,
                  description: row.description,
                  occurredAt: row.occurredAt,
                  status: row.status,
                  createdAt: row.createdAt,
                ),
              )
              .toList(),
        );
  }

  @override
  Future<BankMovement> registerMovement({
    required String tenantId,
    required String accountId,
    required double amount,
    required String type,
    String? description,
    required DateTime occurredAt,
  }) async {
    final normalizedType = type.toLowerCase();
    if (normalizedType != 'deposit' && normalizedType != 'withdraw') {
      throw StateError('Tipo de movimiento no soportado');
    }
    if (amount <= 0) {
      throw StateError('El monto debe ser mayor a cero');
    }

    final id = 'bank-${DateTime.now().microsecondsSinceEpoch}';
    final now = DateTime.now();

    late BankMovement movement;

    await _db.transaction(() async {
      final existingAccount = await (_db.select(
        _db.bankAccounts,
      )..where((tbl) => tbl.id.equals(accountId))).getSingleOrNull();

      final account =
          existingAccount ??
          BankAccountEntity(
            id: accountId,
            tenantId: tenantId,
            name: 'Cuenta demo',
            currency: 'MXN',
            balance: 0,
            updatedAt: now,
          );

      if (account.tenantId != tenantId) {
        throw StateError('Cuenta no pertenece al tenant');
      }

      if (normalizedType == 'withdraw' && account.balance < amount) {
        throw StateError('Saldo insuficiente para el retiro');
      }

      final newBalance = normalizedType == 'withdraw'
          ? account.balance - amount
          : account.balance + amount;

      await _movementDao.insert(
        BankMovementsCompanion.insert(
          id: id,
          tenantId: tenantId,
          accountId: accountId,
          amount: amount,
          type: Value(normalizedType),
          description: Value(description),
          occurredAt: occurredAt,
          status: const Value('queued'),
          createdAt: now,
        ),
      );

      await _accountDao.upsert(
        BankAccountsCompanion(
          id: Value(account.id),
          tenantId: Value(account.tenantId),
          name: Value(account.name),
          currency: Value(account.currency),
          balance: Value(newBalance),
          updatedAt: Value(now),
        ),
      );

      await _outboxRepository.enqueue(
        tenantId: tenantId,
        entity: 'bank-movement',
        payload: {
          'id': id,
          'accountId': accountId,
          'amount': amount,
          'type': normalizedType,
          'description': description,
          'occurredAt': occurredAt.toIso8601String(),
        },
      );

      movement = BankMovement(
        id: id,
        tenantId: tenantId,
        accountId: accountId,
        amount: amount,
        type: normalizedType,
        description: description,
        occurredAt: occurredAt,
        status: 'queued',
        createdAt: now,
      );
    });

    return movement;
  }

  @override
  Future<void> updateMovementStatus({
    required String id,
    required String status,
  }) {
    return _movementDao.updateStatus(id: id, status: status);
  }

  @override
  Future<void> ensureDemoAccounts(String tenantId) async {
    final existing = await _accountDao.loadByTenant(tenantId);
    if (existing.isNotEmpty) {
      return;
    }

    final now = DateTime.now();
    final demoAccounts = [
      BankAccountsCompanion.insert(
        id: 'acct-$tenantId-001',
        tenantId: tenantId,
        name: 'Caja general',
        currency: const Value('MXN'),
        balance: const Value(0),
        updatedAt: now,
      ),
      BankAccountsCompanion.insert(
        id: 'acct-$tenantId-002',
        tenantId: tenantId,
        name: 'Banco principal',
        currency: const Value('MXN'),
        balance: const Value(0),
        updatedAt: now,
      ),
    ];

    for (final account in demoAccounts) {
      await _accountDao.upsert(account);
    }
  }
}
