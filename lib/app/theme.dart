import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _seedColor = const Color(0xFF00537A);

final lightThemeProvider = Provider<ThemeData>((ref) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(centerTitle: true),
  );
});

final darkThemeProvider = Provider<ThemeData>((ref) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
});
