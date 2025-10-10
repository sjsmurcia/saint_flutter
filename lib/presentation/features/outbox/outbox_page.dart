import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import '../../../application/sync/sync_coordinator.dart';
import '../../../di/providers.dart';
import '../../widgets/app_scaffold.dart';

class OutboxPage extends ConsumerWidget {
  const OutboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final outboxAsync = ref.watch(outboxStreamProvider);
    final dateFormatter = DateFormat.yMMMd().add_Hm();

    return AppScaffold(
      title: l10n?.outboxTitle ?? 'Pendientes por sincronizar',
      child: RefreshIndicator(
        onRefresh: () => ref.read(syncCoordinatorProvider).syncNow(),
        child: outboxAsync.when(
          data: (entries) {
            if (entries.isEmpty) {
              return ListView(
                padding: const EdgeInsets.all(32),
                children: [
                  Center(
                    child: Text(
                      l10n?.outboxEmpty ?? 'Sin documentos pendientes',
                    ),
                  ),
                ],
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: entries.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final entry = entries[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.sync_problem,
                      color: Colors.orange,
                    ),
                    title: Text(entry.entity.toUpperCase()),
                    subtitle: Text(
                      dateFormatter.format(entry.createdAt.toLocal()),
                    ),
                    trailing: Text(entry.status),
                  ),
                );
              },
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
}
