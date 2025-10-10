import 'package:drift/drift.dart';

import '../database/app_database.dart';

class BankAccountDao {
  BankAccountDao(this._db);

  final AppDatabase _db;

  Stream<List<BankAccountEntity>> watchByTenant(String tenantId) {
    return (_db.select(_db.bankAccounts)
          ..where((tbl) => tbl.tenantId.equals(tenantId))
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.name)]))
        .watch();
  }

  Future<List<BankAccountEntity>> loadByTenant(String tenantId) {
    return (_db.select(
      _db.bankAccounts,
    )..where((tbl) => tbl.tenantId.equals(tenantId))).get();
  }

  Future<void> upsert(BankAccountsCompanion companion) {
    return _db.into(_db.bankAccounts).insertOnConflictUpdate(companion);
  }
}
