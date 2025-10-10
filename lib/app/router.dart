import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../di/providers.dart';
import '../presentation/features/auth/login_page.dart';
import '../presentation/features/banks/banks_page.dart';
import '../presentation/features/catalog/clients_page.dart';
import '../presentation/features/catalog/products_page.dart';
import '../presentation/features/home/home_page.dart';
import '../presentation/features/outbox/outbox_page.dart';
import '../presentation/features/purchases/purchases_page.dart';
import '../presentation/features/reports/reports_page.dart';
import '../presentation/features/sales/sales_page.dart';
import '../utils/go_router_refresh_stream.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.watch(authControllerProvider.notifier);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: GoRouterRefreshStream(authNotifier.stream),
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      final bool isLoggingIn = state.matchedLocation == '/login';

      return authState.map(
        unknown: (_) => null,
        loading: (_) => null,
        authenticated: (_) {
          if (isLoggingIn) {
            return '/home';
          }
          return null;
        },
        unauthenticated: (_) => isLoggingIn ? null : '/login',
        error: (_) => isLoggingIn ? null : '/login',
      );
    },
    routes: [
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
            builder: (context, state) => const ProductsPage(),
          ),
          GoRoute(
            path: 'catalog/clients',
            name: 'clients',
            builder: (context, state) => const ClientsPage(),
          ),
          GoRoute(
            path: 'sales',
            name: 'sales',
            builder: (context, state) => const SalesPage(),
          ),
          GoRoute(
            path: 'purchases',
            name: 'purchases',
            builder: (context, state) => const PurchasesPage(),
          ),
          GoRoute(
            path: 'banks',
            name: 'banks',
            builder: (context, state) => const BanksPage(),
          ),
          GoRoute(
            path: 'reports',
            name: 'reports',
            builder: (context, state) => const ReportsPage(),
          ),
          GoRoute(
            path: 'outbox',
            name: 'outbox',
            builder: (context, state) => const OutboxPage(),
          ),
        ],
      ),
    ],
  );
});
