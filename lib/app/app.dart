import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import 'router.dart';
import 'theme.dart';

class SaintApp extends ConsumerWidget {
  const SaintApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final lightTheme = ref.watch(lightThemeProvider);
    final darkTheme = ref.watch(darkThemeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx)?.appTitle ?? 'Saint',
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
