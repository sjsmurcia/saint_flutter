import 'package:drift/drift.dart';

import '../database/app_database.dart';

class ClientDao {
  ClientDao(this._db);

  final AppDatabase _db;

  Stream<List<ClientEntity>> watchAll() {
    return (_db.select(
      _db.clients,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();
  }

  Future<void> replaceAll(List<ClientsCompanion> entries) async {
    await _db.transaction(() async {
      await _db.delete(_db.clients).go();
      if (entries.isNotEmpty) {
        await _db.batch((batch) {
          batch.insertAllOnConflictUpdate(_db.clients, entries);
        });
      }
    });
  }

  Future<List<ClientEntity>> fetchPage({
    required String tenantId,
    required int limit,
    required int offset,
  }) {
    final query = _db.select(_db.clients)
      ..where((tbl) => tbl.tenantId.equals(tenantId))
      ..orderBy([(t) => OrderingTerm(expression: t.name)]);
    query.limit(limit, offset: offset);
    return query.get();
  }
}


