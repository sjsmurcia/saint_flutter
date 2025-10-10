import 'package:drift/drift.dart';

import '../database/app_database.dart';

class PurchaseDao {
  PurchaseDao(this._db);

  final AppDatabase _db;

  Stream<List<PurchaseDocumentEntity>> watchAll() {
    return (_db.select(
      _db.purchaseDocuments,
    )..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();
  }

  Future<void> insert(PurchaseDocumentsCompanion companion) {
    return _db.into(_db.purchaseDocuments).insertOnConflictUpdate(companion);
  }

  Future<void> updateStatus({required String id, required String status}) {
    return (_db.update(
      _db.purchaseDocuments,
    )..where((tbl) => tbl.id.equals(id))).write(
      PurchaseDocumentsCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
