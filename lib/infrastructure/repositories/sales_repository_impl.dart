import 'package:drift/drift.dart';

import '../../domain/models/sale_document.dart';
import '../../domain/repositories/outbox_repository.dart';
import '../../domain/repositories/sales_repository.dart';
import '../local/dao/sales_dao.dart';
import '../local/database/app_database.dart';

class SalesRepositoryImpl implements SalesRepository {
  SalesRepositoryImpl(this._dao, this._outboxRepository);

  final SalesDao _dao;
  final OutboxRepository _outboxRepository;

  @override
  Stream<List<SaleDocument>> watchAll() {
    return _dao.watchAll().map(
      (rows) => rows
          .map(
            (row) => SaleDocument(
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
  Future<SaleDocument> createDraft({
    required String tenantId,
    required String companyId,
    required String branchId,
    required double total,
  }) async {
    final now = DateTime.now();
    final id = 'sale-${now.microsecondsSinceEpoch}';
    final companion = SalesDocumentsCompanion.insert(
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

    final document = SaleDocument(
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
      entity: 'sale',
      payload: document.toJson(),
    );

    return document;
  }

  @override
  Future<void> updateStatus({required String id, required String status}) {
    return _dao.updateStatus(id: id, status: status);
  }
}
