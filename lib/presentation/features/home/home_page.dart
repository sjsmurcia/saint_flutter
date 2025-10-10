import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../di/providers.dart';
import '../../../gen_l10n/app_localizations.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/company_selector_sheet.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final session = ref
        .watch(authControllerProvider)
        .maybeWhen(authenticated: (session) => session, orElse: () => null);
    final companyState = ref.watch(companySelectionControllerProvider);

    final companyName = companyState.selectedCompany?.name;
    final branchName = companyState.selectedBranch?.name;
    final companyLabel = (companyName != null && branchName != null)
        ? '$companyName - $branchName'
        : (l10n?.companySelectorTitle ?? 'Selecciona empresa y sucursal');

    return AppScaffold(
      title: l10n?.homeTitle ?? 'Panel',
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          if (session != null)
            Card(
              child: ListTile(
                leading: const Icon(Icons.person_pin),
                title: Text(session.userName),
                subtitle: Text(
                  '${l10n?.tenantLabel ?? 'Tenant'}: ${session.tenantId}',
                ),
              ),
            ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.domain_outlined),
              title: Text(companyLabel),
              subtitle: Text(l10n?.companySelectorTooltip ?? 'Cambiar empresa'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showCompanySelectorSheet(context),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            l10n?.catalogSectionTitle ?? 'Catalogos',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: Text(l10n?.productsTitle ?? 'Productos'),
              subtitle: Text(
                l10n?.productsSubtitle ??
                    'Consulta y sincroniza el catalogo local',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/home/catalog/products'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.people_outline),
              title: Text(l10n?.clientsTitle ?? 'Clientes'),
              subtitle: Text(
                l10n?.clientsSubtitle ??
                    'Disponible offline con sincronizacion',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/home/catalog/clients'),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            l10n?.salesTitle ?? 'Ventas',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.point_of_sale_outlined),
              title: Text(l10n?.salesTitle ?? 'Ventas'),
              subtitle: Text(
                l10n?.salesSubtitle ?? 'Captura tickets sin conexion',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/home/sales'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_cart_checkout_outlined),
              title: Text(l10n?.purchasesTitle ?? 'Compras'),
              subtitle: Text(
                l10n?.purchasesSubtitle ??
                    'Captura documentos de proveedor offline',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/home/purchases'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.account_balance_outlined),
              title: Text(l10n?.banksTitle ?? 'Bancos'),
              subtitle: Text(
                l10n?.banksSubtitle ?? 'Movimientos basicos offline',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/home/banks'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.picture_as_pdf_outlined),
              title: Text(l10n?.reportsTitle ?? 'Reportes'),
              subtitle: Text(
                l10n?.generateSalesPeriodButton ?? 'Genera y comparte PDF',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/home/reports'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.sync_outlined),
              title: Text(l10n?.outboxTitle ?? 'Pendientes por sincronizar'),
              subtitle: Text(l10n?.manualSyncButton ?? 'Sincronizar ahora'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/home/outbox'),
            ),
          ),
        ],
      ),
    );
  }
}
