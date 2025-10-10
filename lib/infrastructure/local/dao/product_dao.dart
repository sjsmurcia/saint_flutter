import 'package:drift/drift.dart';

import '../database/app_database.dart';

class ProductDao {
  ProductDao(this._db);

  final AppDatabase _db;

  Stream<List<ProductEntity>> watchAll() {
    return (_db.select(
      _db.products,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();
  }

  Future<void> replaceAll(List<ProductsCompanion> entries) async {
    await _db.transaction(() async {
      await _db.delete(_db.products).go();
      if (entries.isNotEmpty) {
        await _db.batch((batch) {
          batch.insertAllOnConflictUpdate(_db.products, entries);
        });
      }
    });
  }
}
