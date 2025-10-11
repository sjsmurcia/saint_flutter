import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import 'package:saint_flutter/di/providers.dart';
import '../../widgets/app_scaffold.dart';
import '../../../application/catalog/client_list_controller.dart';

class ClientsPage extends ConsumerStatefulWidget {
  const ClientsPage({super.key});

  @override
  ConsumerState<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends ConsumerState<ClientsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(clientSyncTriggerProvider.future));
  }

  Future<void> _sync(ClientListController controller) async {
    ref.invalidate(clientSyncTriggerProvider);
    await ref.read(clientSyncTriggerProvider.future);
    await controller.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(clientListControllerProvider);
    final controller = ref.read(clientListControllerProvider.notifier);

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
            l10n?.clientsEmpty ?? 'Sin clientes sincronizados',
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
          final client = state.items[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.business_outlined),
              title: Text(client.name),
              subtitle: Text(client.email ?? 'sin correo'),
              trailing: Text(client.phone ?? '--'),
            ),
          );
        },
      );
    }

    return AppScaffold(
      title: l10n?.clientsTitle ?? 'Clientes',
      child: RefreshIndicator(
        onRefresh: () => _sync(controller),
        child: buildBody(),
      ),
    );
  }
}
