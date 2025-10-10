import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import '../../../application/sales/sales_service.dart';
import '../../../application/sync/sync_coordinator.dart';
import '../../../di/providers.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/company_selector_sheet.dart';

class SalesPage extends ConsumerWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final salesAsync = ref.watch(salesStreamProvider);
    final companyState = ref.watch(companySelectionControllerProvider);
    final currencyFormatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toLanguageTag(),
    );

    return AppScaffold(
      title: l10n?.salesTitle ?? 'Ventas',
      child: RefreshIndicator(
        onRefresh: () => ref.read(syncCoordinatorProvider).syncNow(),
        child: salesAsync.when(
          data: (sales) {
            final hasSelection =
                companyState.selectedCompany != null &&
                companyState.selectedBranch != null;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.store_mall_directory_outlined),
                    title: Text(
                      hasSelection
                          ? '${companyState.selectedCompany!.name} - ${companyState.selectedBranch!.name}'
                          : (l10n?.companySelectorTitle ??
                                'Selecciona empresa y sucursal'),
                    ),
                    subtitle: hasSelection
                        ? Text(
                            l10n?.backgroundSyncEnabled ??
                                'Sincronizacion en segundo plano activa',
                          )
                        : Text(
                            l10n?.companySelectorTooltip ?? 'Cambiar empresa',
                          ),
                    trailing: IconButton(
                      icon: const Icon(Icons.swap_horiz),
                      tooltip:
                          l10n?.companySelectorTooltip ?? 'Cambiar empresa',
                      onPressed: () => showCompanySelectorSheet(context),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () async {
                    final total = await _askForTotal(context, l10n);
                    if (total == null) return;
                    try {
                      await ref
                          .read(salesServiceProvider)
                          .createDraft(total: total);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n?.documentCreatedMessage ??
                                  'Documento guardado',
                            ),
                          ),
                        );
                      }
                    } catch (error) {
                      if (!context.mounted) return;
                      final message = error is StateError
                          ? error.message
                          : l10n?.genericError ?? 'Ocurrio un error';
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(message)));
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: Text(l10n?.createSaleButton ?? 'Registrar venta'),
                ),
                const SizedBox(height: 24),
                if (sales.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Center(
                      child: Text(l10n?.salesEmpty ?? 'Sin ventas registradas'),
                    ),
                  )
                else
                  for (final sale in sales)
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.receipt_long_outlined),
                        title: Text(currencyFormatter.format(sale.total)),
                        subtitle: Text('${sale.companyId} / ${sale.branchId}'),
                        trailing: Text(
                          sale.status == 'draft'
                              ? (l10n?.documentStatusDraft ?? 'Borrador')
                              : (l10n?.documentStatusSent ?? 'Sincronizado'),
                        ),
                      ),
                    ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(l10n?.genericError ?? 'Ocurrio un error'),
              const SizedBox(height: 16),
              Text(error.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Future<double?> _askForTotal(
    BuildContext context,
    AppLocalizations? l10n,
  ) async {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final result = await showDialog<double>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n?.createSaleButton ?? 'Registrar venta'),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: l10n?.documentTotalLabel ?? 'Importe total',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n?.fieldRequired ?? 'Campo requerido';
                }
                final parsed = double.tryParse(value.replaceAll(',', '.'));
                if (parsed == null || parsed <= 0) {
                  return l10n?.invalidAmount ?? 'Monto invalido';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n?.close ?? 'Cerrar'),
            ),
            FilledButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  final parsed = double.parse(
                    controller.text.replaceAll(',', '.'),
                  );
                  Navigator.of(context).pop(parsed);
                }
              },
              child: Text(l10n?.createSaleButton ?? 'Registrar venta'),
            ),
          ],
        );
      },
    );
    return result;
  }
}
