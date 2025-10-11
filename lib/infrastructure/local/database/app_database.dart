import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@TableIndex(name: 'products_tenant_name_idx', columns: {#tenantId, #name})
@TableIndex(name: 'products_tenant_updated_idx', columns: {#tenantId, #updatedAt})
@TableIndex(name: 'products_tenant_sku_idx', columns: {#tenantId, #sku})
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

@TableIndex(name: 'clients_tenant_name_idx', columns: {#tenantId, #name})
@TableIndex(name: 'clients_tenant_updated_idx', columns: {#tenantId, #updatedAt})
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

@TableIndex(name: 'sales_tenant_status_idx', columns: {#tenantId, #status})
@TableIndex(name: 'sales_tenant_created_idx', columns: {#tenantId, #createdAt})
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

@TableIndex(name: 'purchases_tenant_status_idx', columns: {#tenantId, #status})
@TableIndex(name: 'purchases_tenant_created_idx', columns: {#tenantId, #createdAt})
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

@TableIndex(name: 'bank_accounts_tenant_name_idx', columns: {#tenantId, #name})
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

@TableIndex(name: 'bank_movements_account_occurred_idx', columns: {#accountId, #occurredAt})
@TableIndex(name: 'bank_movements_tenant_occurred_idx', columns: {#tenantId, #occurredAt})
@TableIndex(name: 'bank_movements_tenant_status_idx', columns: {#tenantId, #status})
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

@TableIndex(name: 'outbox_status_idx', columns: {#status})
@TableIndex(name: 'outbox_tenant_created_idx', columns: {#tenantId, #createdAt})
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
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(salesDocuments);
        await migrator.createTable(purchaseDocuments);
        await migrator.addColumn(outboxEntries, outboxEntries.processedAt);
        from = 2;
      }
      if (from < 3) {
        await migrator.createTable(bankAccounts);
        await migrator.createTable(bankMovements);
        from = 3;
      }
      if (from < 4) {
        await _createPerformanceIndexes();
      }
    },
  );

  Future<void> _createPerformanceIndexes() async {
    await customStatement(
      'CREATE INDEX IF NOT EXISTS products_tenant_name_idx ON products (tenant_id, name)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS products_tenant_updated_idx ON products (tenant_id, updated_at)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS products_tenant_sku_idx ON products (tenant_id, sku)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS clients_tenant_name_idx ON clients (tenant_id, name)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS clients_tenant_updated_idx ON clients (tenant_id, updated_at)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS sales_tenant_status_idx ON sales_documents (tenant_id, status)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS sales_tenant_created_idx ON sales_documents (tenant_id, created_at)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS purchases_tenant_status_idx ON purchase_documents (tenant_id, status)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS purchases_tenant_created_idx ON purchase_documents (tenant_id, created_at)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS bank_accounts_tenant_name_idx ON bank_accounts (tenant_id, name)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS bank_movements_account_occurred_idx ON bank_movements (account_id, occurred_at)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS bank_movements_tenant_occurred_idx ON bank_movements (tenant_id, occurred_at)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS bank_movements_tenant_status_idx ON bank_movements (tenant_id, status)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS outbox_status_idx ON outbox_entries (status)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS outbox_tenant_created_idx ON outbox_entries (tenant_id, created_at)',
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'saint.db'));
    return NativeDatabase.createInBackground(file);
  });
}
