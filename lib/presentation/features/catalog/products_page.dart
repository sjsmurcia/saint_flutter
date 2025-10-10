import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import 'package:saint_flutter/di/providers.dart';
import '../../widgets/app_scaffold.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(productSyncTriggerProvider.future));
  }

  Future<void> _sync() async {
    ref.invalidate(productSyncTriggerProvider);
    await ref.read(productSyncTriggerProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final productsAsync = ref.watch(productsStreamProvider);

    return AppScaffold(
      title: l10n?.productsTitle ?? 'Productos',
      child: RefreshIndicator(
        onRefresh: _sync,
        child: productsAsync.when(
          data: (products) {
            if (products.isEmpty) {
              return ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Center(
                    child: Text(
                      l10n?.productsEmpty ?? 'Sin productos sincronizados',
                    ),
                  ),
                ],
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.inventory_2_outlined),
                    title: Text(product.name),
                    subtitle: Text('${product.sku} | ${product.companyId}'),
                    trailing: Text(product.price.toStringAsFixed(2)),
                  ),
                );
              },
            );
          },
          loading: () => ListView(
            padding: const EdgeInsets.all(24),
            children: const [Center(child: CircularProgressIndicator())],
          ),
          error: (error, stackTrace) => ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(l10n?.genericError ?? 'Ocurrio un error'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _sync,
                child: Text(l10n?.retry ?? 'Reintentar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
