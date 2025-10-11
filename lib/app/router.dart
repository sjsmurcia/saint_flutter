import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../di/providers.dart';
import '../presentation/features/auth/login_page.dart';
import '../presentation/features/banks/banks_page.dart';
import '../presentation/features/catalog/clients_page.dart';
import '../presentation/features/catalog/products_page.dart';
import '../presentation/features/home/home_page.dart';
import '../presentation/features/license/license_page.dart';
import '../presentation/features/outbox/outbox_page.dart';
import '../presentation/features/purchases/purchases_page.dart';
import '../presentation/features/reports/reports_page.dart';
import '../presentation/features/sales/sales_page.dart';
import '../domain/models/license_info_extensions.dart';
import '../domain/models/user_session_extensions.dart';
import '../utils/go_router_refresh_stream.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.watch(authControllerProvider.notifier);
  final licenseNotifier = ref.watch(licenseControllerProvider.notifier);

  String? guardAccess(String entitlement, String permission) {
    final licenseInfo = ref.read(licenseControllerProvider).maybeWhen(
      active: (info, _) => info,
      orElse: () => null,
    );
    final session = ref.read(authControllerProvider).maybeWhen(
      authenticated: (session) => session,
      orElse: () => null,
    );
    if (licenseInfo == null || session == null) {
      return '/home';
    }
    final allowed = licenseInfo.allows(entitlement) && session.hasPermission(permission);
    return allowed ? null : '/home';
  }

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: GoRouterRefreshStream(
      [authNotifier.stream, licenseNotifier.stream],
    ),
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      final licenseState = ref.read(licenseControllerProvider);
      final bool isLoggingIn = state.matchedLocation == '/login';
      final bool isLicenseRoute = state.matchedLocation == '/license';

      final licensePending = licenseState.maybeWhen(
        unknown: () => true,
        loading: () => true,
        orElse: () => false,
      );
      if (licensePending) {
        return null;
      }

      final licenseNeedsAttention = licenseState.maybeWhen(
        inactive: () => true,
        expired: (_) => true,
        graceExpired: (_) => true,
        error: (_) => true,
        orElse: () => false,
      );

      if (licenseNeedsAttention && !isLicenseRoute) {
        return '/license';
      }

      if (!licenseNeedsAttention && isLicenseRoute) {
        return authState.maybeWhen(
          authenticated: (_) => '/home',
          orElse: () => '/login',
        );
      }

      return authState.map(
        unknown: (_) => null,
        loading: (_) => null,
        authenticated: (_) => isLoggingIn ? '/home' : null,
        unauthenticated: (_) => isLoggingIn ? null : '/login',
        error: (_) => isLoggingIn ? null : '/login',
      );
    },
    routes: [
      GoRoute(
        path: '/license',
        name: 'license',
        builder: (context, state) => const LicensePage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'catalog/products',
            name: 'products',
            redirect: (context, state) => guardAccess('catalog', 'catalog.products.view'),
            builder: (context, state) => const ProductsPage(),
          ),
          GoRoute(
            path: 'catalog/clients',
            name: 'clients',
            redirect: (context, state) => guardAccess('catalog', 'catalog.clients.view'),
            builder: (context, state) => const ClientsPage(),
          ),
          GoRoute(
            path: 'sales',
            name: 'sales',
            redirect: (context, state) => guardAccess('sales', 'sales.access'),
            builder: (context, state) => const SalesPage(),
          ),
          GoRoute(
            path: 'purchases',
            name: 'purchases',
            redirect: (context, state) => guardAccess('purchases', 'purchases.access'),
            builder: (context, state) => const PurchasesPage(),
          ),
          GoRoute(
            path: 'banks',
            name: 'banks',
            redirect: (context, state) => guardAccess('banks', 'banks.access'),
            builder: (context, state) => const BanksPage(),
          ),
          GoRoute(
            path: 'reports',
            name: 'reports',
            redirect: (context, state) => guardAccess('reports', 'reports.generate'),
            builder: (context, state) => const ReportsPage(),
          ),
          GoRoute(
            path: 'outbox',
            name: 'outbox',
            redirect: (context, state) => guardAccess('sales', 'outbox.access'),
            builder: (context, state) => const OutboxPage(),
          ),
        ],
      ),
    ],
  );
});
