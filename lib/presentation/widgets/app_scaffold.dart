import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import 'package:saint_flutter/di/providers.dart';

class AppScaffold extends ConsumerWidget {
  const AppScaffold({super.key, required this.child, this.title});

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? l10n?.appTitle ?? 'Saint'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: l10n?.logoutTooltip ?? 'Salir',
            onPressed: () async {
              await ref.read(authControllerProvider.notifier).logout();
              if (context.mounted) {
                context.go('/login');
              }
            },
          ),
        ],
      ),
      body: SafeArea(child: child),
    );
  }
}
