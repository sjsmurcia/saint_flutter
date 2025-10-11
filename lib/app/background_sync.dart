import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';

import '../application/sync/sync_coordinator.dart';
import '../di/providers.dart';

const backgroundSyncTask = 'saint_background_sync';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();
    try {
      await container
          .read(licenseControllerProvider.notifier)
          .checkIn();
      await container.read(syncCoordinatorProvider).syncNow();
      return true;
    } catch (_) {
      return false;
    } finally {
      container.dispose();
    }
  });
}
