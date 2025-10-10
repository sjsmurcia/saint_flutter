import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import 'package:saint_flutter/di/providers.dart';
import '../../widgets/app_scaffold.dart';

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

  Future<void> _sync() async {
    ref.invalidate(clientSyncTriggerProvider);
    await ref.read(clientSyncTriggerProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final clientsAsync = ref.watch(clientsStreamProvider);

    return AppScaffold(
      title: l10n?.clientsTitle ?? 'Clientes',
      child: RefreshIndicator(
        onRefresh: _sync,
        child: clientsAsync.when(
          data: (clients) {
            if (clients.isEmpty) {
              return ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Center(
                    child: Text(
                      l10n?.clientsEmpty ?? 'Sin clientes sincronizados',
                    ),
                  ),
                ],
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: clients.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final client = clients[index];
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
