import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DataClassName('ProductEntity')
class Products extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get companyId => text()();
  TextColumn get branchId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get sku => text()();
  RealColumn get price => real()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ClientEntity')
class Clients extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SalesDocumentEntity')
class SalesDocuments extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get companyId => text()();
  TextColumn get branchId => text()();
  RealColumn get total => real()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PurchaseDocumentEntity')
class PurchaseDocuments extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get companyId => text()();
  TextColumn get branchId => text()();
  RealColumn get total => real()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BankAccountEntity')
class BankAccounts extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get name => text()();
  TextColumn get currency => text().withDefault(const Constant('MXN'))();
  RealColumn get balance => real().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BankMovementEntity')
class BankMovements extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get accountId => text()();
  RealColumn get amount => real()();
  TextColumn get type => text().withDefault(const Constant('deposit'))();
  TextColumn get description => text().nullable()();
  DateTimeColumn get occurredAt => dateTime()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SyncStateEntity')
class SyncStates extends Table {
  TextColumn get id => text()();
  TextColumn get entity => text()();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('OutboxEntryEntity')
class OutboxEntries extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get entity => text()();
  TextColumn get payload => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get processedAt => dateTime().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Products,
    Clients,
    SalesDocuments,
    PurchaseDocuments,
    BankAccounts,
    BankMovements,
    SyncStates,
    OutboxEntries,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from == 1) {
        await migrator.createTable(salesDocuments);
        await migrator.createTable(purchaseDocuments);
        await migrator.addColumn(outboxEntries, outboxEntries.processedAt);
        from = 2;
      }
      if (from == 2) {
        await migrator.createTable(bankAccounts);
        await migrator.createTable(bankMovements);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'saint.db'));
    return NativeDatabase.createInBackground(file);
  });
}
