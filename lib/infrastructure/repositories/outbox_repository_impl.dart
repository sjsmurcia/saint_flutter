import 'dart:convert';

import '../../domain/models/outbox_entry.dart';
import '../../domain/repositories/outbox_repository.dart';
import '../local/dao/outbox_dao.dart';
import '../local/database/app_database.dart';

class OutboxRepositoryImpl implements OutboxRepository {
  OutboxRepositoryImpl(this._dao);

  final OutboxDao _dao;

  @override
  Future<void> enqueue({
    required String tenantId,
    required String entity,
    required Map<String, dynamic> payload,
  }) {
    final entry = OutboxEntriesCompanion.insert(
      id: 'outbox-${DateTime.now().microsecondsSinceEpoch}',
      tenantId: tenantId,
      entity: entity,
      payload: jsonEncode(payload),
    );
    return _dao.enqueue(entry);
  }

  @override
  Future<List<OutboxEntry>> loadPending() async {
    final rows = await _dao.getPending();
    return rows
        .map(
          (row) => OutboxEntry(
            id: row.id,
            tenantId: row.tenantId,
            entity: row.entity,
            payload: row.payload,
            status: row.status,
            createdAt: row.createdAt,
            processedAt: row.processedAt,
          ),
        )
        .toList();
  }

  @override
  Future<void> markProcessed(String id) {
    return _dao.markProcessed(id);
  }

  @override
  Stream<List<OutboxEntry>> watchPending() {
    return _dao.watchPending().map(
      (rows) => rows
          .map(
            (row) => OutboxEntry(
              id: row.id,
              tenantId: row.tenantId,
              entity: row.entity,
              payload: row.payload,
              status: row.status,
              createdAt: row.createdAt,
              processedAt: row.processedAt,
            ),
          )
          .toList(),
    );
  }
}
