import 'package:drift/drift.dart';

import '../database/app_database.dart';

class OutboxDao {
  OutboxDao(this._db);

  final AppDatabase _db;

  Future<void> enqueue(OutboxEntriesCompanion entry) {
    return _db.into(_db.outboxEntries).insert(entry);
  }

  Stream<List<OutboxEntryEntity>> watchPending() {
    return (_db.select(_db.outboxEntries)
          ..where((tbl) => tbl.status.equals('pending'))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .watch();
  }

  Future<List<OutboxEntryEntity>> getPending() {
    return (_db.select(_db.outboxEntries)
          ..where((tbl) => tbl.status.equals('pending'))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .get();
  }

  Future<void> markProcessed(String id) {
    return (_db.update(
      _db.outboxEntries,
    )..where((tbl) => tbl.id.equals(id))).write(
      OutboxEntriesCompanion(
        status: const Value('sent'),
        processedAt: Value(DateTime.now()),
      ),
    );
  }
}
