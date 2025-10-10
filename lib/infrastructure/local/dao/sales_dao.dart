import 'package:drift/drift.dart';

import '../database/app_database.dart';

class SalesDao {
  SalesDao(this._db);

  final AppDatabase _db;

  Stream<List<SalesDocumentEntity>> watchAll() {
    return (_db.select(
      _db.salesDocuments,
    )..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();
  }

  Future<void> insert(SalesDocumentsCompanion companion) {
    return _db.into(_db.salesDocuments).insertOnConflictUpdate(companion);
  }

  Future<void> updateStatus({required String id, required String status}) {
    return (_db.update(
      _db.salesDocuments,
    )..where((tbl) => tbl.id.equals(id))).write(
      SalesDocumentsCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
