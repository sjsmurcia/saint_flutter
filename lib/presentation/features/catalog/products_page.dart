import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import 'package:saint_flutter/di/providers.dart';
import '../../widgets/app_scaffold.dart';
import '../../../application/catalog/product_list_controller.dart';

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

  Future<void> _sync(ProductListController controller) async {
    ref.invalidate(productSyncTriggerProvider);
    await ref.read(productSyncTriggerProvider.future);
    await controller.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(productListControllerProvider);
    final controller = ref.read(productListControllerProvider.notifier);

    Widget buildBody() {
      if (state.isLoading && state.items.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.errorMessage != null && state.items.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.errorMessage ?? ''),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: controller.loadInitial,
                child: Text(l10n?.retry ?? 'Reintentar'),
              ),
            ],
          ),
        );
      }
      if (state.items.isEmpty) {
        return Center(
          child: Text(
            l10n?.productsEmpty ?? 'Sin productos sincronizados',
          ),
        );
      }

      final itemCount = state.items.length + (state.hasMore ? 1 : 0);
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index >= state.items.length) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              controller.loadMore();
            });
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final product = state.items[index];
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
    }

    return AppScaffold(
      title: l10n?.productsTitle ?? 'Productos',
      child: RefreshIndicator(
        onRefresh: () => _sync(controller),
        child: buildBody(),
      ),
    );
  }
}
