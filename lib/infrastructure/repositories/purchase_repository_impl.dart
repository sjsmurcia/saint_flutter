import 'package:drift/drift.dart';

import '../../domain/models/purchase_document.dart';
import '../../domain/repositories/outbox_repository.dart';
import '../../domain/repositories/purchase_repository.dart';
import '../local/dao/purchase_dao.dart';
import '../local/database/app_database.dart';

class PurchaseRepositoryImpl implements PurchaseRepository {
  PurchaseRepositoryImpl(this._dao, this._outboxRepository);

  final PurchaseDao _dao;
  final OutboxRepository _outboxRepository;

  @override
  Stream<List<PurchaseDocument>> watchAll() {
    return _dao.watchAll().map(
      (rows) => rows
          .map(
            (row) => PurchaseDocument(
              id: row.id,
              tenantId: row.tenantId,
              companyId: row.companyId,
              branchId: row.branchId,
              total: row.total,
              status: row.status,
              createdAt: row.createdAt,
              updatedAt: row.updatedAt,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<PurchaseDocument> createDraft({
    required String tenantId,
    required String companyId,
    required String branchId,
    required double total,
  }) async {
    final now = DateTime.now();
    final id = 'purchase-${now.microsecondsSinceEpoch}';
    final companion = PurchaseDocumentsCompanion.insert(
      id: id,
      tenantId: tenantId,
      companyId: companyId,
      branchId: branchId,
      total: total,
      status: const Value('draft'),
      createdAt: now,
      updatedAt: now,
    );

    await _dao.insert(companion);

    final document = PurchaseDocument(
      id: id,
      tenantId: tenantId,
      companyId: companyId,
      branchId: branchId,
      total: total,
      status: 'draft',
      createdAt: now,
      updatedAt: now,
    );

    await _outboxRepository.enqueue(
      tenantId: tenantId,
      entity: 'purchase',
      payload: document.toJson(),
    );

    return document;
  }

  @override
  Future<void> updateStatus({required String id, required String status}) {
    return _dao.updateStatus(id: id, status: status);
  }
}
