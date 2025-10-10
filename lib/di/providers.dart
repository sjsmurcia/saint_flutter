import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../application/auth/auth_controller.dart';
import '../application/auth/auth_state.dart';
import '../application/company/company_selection_controller.dart';
import '../application/company/company_selection_state.dart';
import '../application/reports/report_service.dart';
import '../application/reports/reports_controller.dart';
import '../domain/models/bank_account.dart';
import '../domain/models/bank_movement.dart';
import '../domain/models/client.dart';
import '../domain/models/outbox_entry.dart';
import '../domain/models/product.dart';
import '../domain/models/purchase_document.dart';
import '../domain/models/report_document.dart';
import '../domain/models/sale_document.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/bank_repository.dart';
import '../domain/repositories/company_repository.dart';
import '../domain/repositories/client_repository.dart';
import '../domain/repositories/outbox_repository.dart';
import '../domain/repositories/product_repository.dart';
import '../domain/repositories/purchase_repository.dart';
import '../domain/repositories/report_repository.dart';
import '../domain/repositories/sales_repository.dart';
import '../infrastructure/local/dao/bank_account_dao.dart';
import '../infrastructure/local/dao/bank_movement_dao.dart';
import '../infrastructure/local/dao/client_dao.dart';
import '../infrastructure/local/dao/outbox_dao.dart';
import '../infrastructure/local/dao/product_dao.dart';
import '../infrastructure/local/dao/purchase_dao.dart';
import '../infrastructure/local/dao/sales_dao.dart';
import '../infrastructure/local/database/app_database.dart';
import '../infrastructure/remote/mock_auth_api.dart';
import '../infrastructure/remote/mock_catalog_api.dart';
import '../infrastructure/repositories/auth_repository_impl.dart';
import '../infrastructure/repositories/bank_repository_impl.dart';
import '../infrastructure/repositories/client_repository_impl.dart';
import '../infrastructure/repositories/company_repository_impl.dart';
import '../infrastructure/repositories/outbox_repository_impl.dart';
import '../infrastructure/repositories/product_repository_impl.dart';
import '../infrastructure/repositories/purchase_repository_impl.dart';
import '../infrastructure/repositories/report_repository_impl.dart';
import '../infrastructure/repositories/sales_repository_impl.dart';

const _defaultReportingBaseUrl = String.fromEnvironment(
  'REPORTING_BASE_URL',
  defaultValue: 'http://10.0.2.2:5088',
);

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final mockAuthApiProvider = Provider<MockAuthApi>((ref) => MockAuthApi());
final mockCatalogApiProvider = Provider<MockCatalogApi>(
  (ref) => MockCatalogApi(),
);

final reportingBaseUrlProvider = Provider<String>(
  (ref) => _defaultReportingBaseUrl,
);

final reportingDioProvider = Provider<Dio>((ref) {
  final baseUrl = ref.watch(reportingBaseUrlProvider);
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
});

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final productDaoProvider = Provider<ProductDao>((ref) {
  final db = ref.watch(databaseProvider);
  return ProductDao(db);
});

final clientDaoProvider = Provider<ClientDao>((ref) {
  final db = ref.watch(databaseProvider);
  return ClientDao(db);
});

final salesDaoProvider = Provider<SalesDao>((ref) {
  final db = ref.watch(databaseProvider);
  return SalesDao(db);
});

final purchaseDaoProvider = Provider<PurchaseDao>((ref) {
  final db = ref.watch(databaseProvider);
  return PurchaseDao(db);
});

final bankAccountDaoProvider = Provider<BankAccountDao>((ref) {
  final db = ref.watch(databaseProvider);
  return BankAccountDao(db);
});

final bankMovementDaoProvider = Provider<BankMovementDao>((ref) {
  final db = ref.watch(databaseProvider);
  return BankMovementDao(db);
});

final outboxDaoProvider = Provider<OutboxDao>((ref) {
  final db = ref.watch(databaseProvider);
  return OutboxDao(db);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(mockAuthApiProvider);
  final storage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(api, storage);
});

final companyRepositoryProvider = Provider<CompanyRepository>((ref) {
  final api = ref.watch(mockCatalogApiProvider);
  return CompanyRepositoryImpl(api);
});

final outboxRepositoryProvider = Provider<OutboxRepository>((ref) {
  final dao = ref.watch(outboxDaoProvider);
  return OutboxRepositoryImpl(dao);
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final dao = ref.watch(productDaoProvider);
  final api = ref.watch(mockCatalogApiProvider);
  return ProductRepositoryImpl(dao, api);
});

final clientRepositoryProvider = Provider<ClientRepository>((ref) {
  final dao = ref.watch(clientDaoProvider);
  final api = ref.watch(mockCatalogApiProvider);
  return ClientRepositoryImpl(dao, api);
});

final salesRepositoryProvider = Provider<SalesRepository>((ref) {
  final dao = ref.watch(salesDaoProvider);
  final outbox = ref.watch(outboxRepositoryProvider);
  return SalesRepositoryImpl(dao, outbox);
});

final purchaseRepositoryProvider = Provider<PurchaseRepository>((ref) {
  final dao = ref.watch(purchaseDaoProvider);
  final outbox = ref.watch(outboxRepositoryProvider);
  return PurchaseRepositoryImpl(dao, outbox);
});

final bankRepositoryProvider = Provider<BankRepository>((ref) {
  final accountDao = ref.watch(bankAccountDaoProvider);
  final movementDao = ref.watch(bankMovementDaoProvider);
  final outbox = ref.watch(outboxRepositoryProvider);
  final db = ref.watch(databaseProvider);
  return BankRepositoryImpl(accountDao, movementDao, outbox, db);
});

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  final dio = ref.watch(reportingDioProvider);
  return ReportRepositoryImpl(dio);
});

final reportServiceProvider = Provider<ReportService>((ref) {
  return ReportService(ref);
});

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final repository = ref.watch(authRepositoryProvider);
    return AuthController(repository);
  },
);

final companySelectionControllerProvider =
    StateNotifierProvider<CompanySelectionController, CompanySelectionState>((
      ref,
    ) {
      final repository = ref.watch(companyRepositoryProvider);
      final storage = ref.watch(secureStorageProvider);
      final controller = CompanySelectionController(repository, storage);
      ref.listen<AuthState>(authControllerProvider, (previous, next) {
        final tenantId = next.maybeWhen(
          authenticated: (session) => session.tenantId,
          orElse: () => null,
        );
        if (tenantId == null) {
          controller.reset();
        } else {
          controller.loadForTenant(tenantId);
        }
      });
      final session = ref
          .read(authControllerProvider)
          .maybeWhen(authenticated: (session) => session, orElse: () => null);
      if (session != null) {
        controller.loadForTenant(session.tenantId);
      }
      return controller;
    });

final reportsControllerProvider =
    StateNotifierProvider<ReportsController, AsyncValue<List<ReportDocument>>>((
      ref,
    ) {
      return ReportsController(ref);
    });

final productsStreamProvider = StreamProvider.autoDispose<List<Product>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.watchAll();
});

final clientsStreamProvider = StreamProvider.autoDispose<List<Client>>((ref) {
  final repository = ref.watch(clientRepositoryProvider);
  return repository.watchAll();
});

final salesStreamProvider = StreamProvider.autoDispose<List<SaleDocument>>((
  ref,
) {
  final repository = ref.watch(salesRepositoryProvider);
  return repository.watchAll();
});

final purchasesStreamProvider =
    StreamProvider.autoDispose<List<PurchaseDocument>>((ref) {
      final repository = ref.watch(purchaseRepositoryProvider);
      return repository.watchAll();
    });

final bankAccountsStreamProvider =
    StreamProvider.autoDispose<List<BankAccount>>((ref) {
      final repository = ref.watch(bankRepositoryProvider);
      final session = ref
          .watch(authControllerProvider)
          .maybeWhen(authenticated: (session) => session, orElse: () => null);
      if (session == null) {
        return Stream<List<BankAccount>>.value(const []);
      }
      repository.ensureDemoAccounts(session.tenantId);
      return repository.watchAccounts(session.tenantId);
    });

final bankMovementsStreamProvider = StreamProvider.autoDispose
    .family<List<BankMovement>, String>((ref, accountId) {
      final repository = ref.watch(bankRepositoryProvider);
      return repository.watchMovements(accountId);
    });

final outboxStreamProvider = StreamProvider.autoDispose<List<OutboxEntry>>((
  ref,
) {
  final repository = ref.watch(outboxRepositoryProvider);
  return repository.watchPending();
});

final productSyncTriggerProvider = FutureProvider.autoDispose<void>((
  ref,
) async {
  final repository = ref.watch(productRepositoryProvider);
  final authState = ref.read(authControllerProvider);
  final session = authState.maybeWhen(
    authenticated: (session) => session,
    orElse: () => null,
  );
  if (session == null) {
    return;
  }
  await repository.sync(session.tenantId);
});

final clientSyncTriggerProvider = FutureProvider.autoDispose<void>((ref) async {
  final repository = ref.watch(clientRepositoryProvider);
  final authState = ref.read(authControllerProvider);
  final session = authState.maybeWhen(
    authenticated: (session) => session,
    orElse: () => null,
  );
  if (session == null) {
    return;
  }
  await repository.sync(session.tenantId);
});
