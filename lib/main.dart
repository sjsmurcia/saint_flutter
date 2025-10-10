import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';

import 'app/app.dart';
import 'app/background_sync.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  await Workmanager().registerPeriodicTask(
    'saint-sync-task',
    backgroundSyncTask,
    frequency: const Duration(minutes: 30),
    initialDelay: const Duration(minutes: 5),
    existingWorkPolicy: ExistingWorkPolicy.keep,
  );
  runApp(const ProviderScope(child: SaintApp()));
}
