import 'dart:async';
import 'package:flutter/widgets.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Iterable<Stream<dynamic>> streams) {
    for (final stream in streams) {
      _subscriptions
          .add(stream.asBroadcastStream().listen((_) => notifyListeners()));
    }
  }

  final List<StreamSubscription<dynamic>> _subscriptions = [];

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
