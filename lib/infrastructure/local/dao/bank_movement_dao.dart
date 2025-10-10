import 'package:drift/drift.dart';

import '../database/app_database.dart';

class BankMovementDao {
  BankMovementDao(this._db);

  final AppDatabase _db;

  Stream<List<BankMovementEntity>> watchByAccount(String accountId) {
    return (_db.select(_db.bankMovements)
          ..where((tbl) => tbl.accountId.equals(accountId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.occurredAt)]))
        .watch();
  }

  Future<void> insert(BankMovementsCompanion companion) {
    return _db.into(_db.bankMovements).insert(companion);
  }

  Future<void> updateStatus({required String id, required String status}) {
    return (_db.update(_db.bankMovements)..where((tbl) => tbl.id.equals(id)))
        .write(BankMovementsCompanion(status: Value(status)));
  }
}
