import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:saint_flutter/app/app.dart';

void main() {
  testWidgets('Login screen renders base fields', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: SaintApp()));
    await tester.pumpAndSettle();

    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(FilledButton), findsOneWidget);
  });
}
