import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/providers.dart';

class SyncCoordinator {
  SyncCoordinator(this._ref);

  final Ref _ref;

  Future<void> syncNow() async {
    final authState = _ref.read(authControllerProvider);
    final session = authState.maybeWhen(
      authenticated: (session) => session,
      orElse: () => null,
    );
    if (session == null) {
      return;
    }

    final tenantId = session.tenantId;

    await Future.wait([
      _ref.read(productRepositoryProvider).sync(tenantId),
      _ref.read(clientRepositoryProvider).sync(tenantId),
    ]);

    await _processOutbox();
  }

  Future<void> _processOutbox() async {
    final outboxRepo = _ref.read(outboxRepositoryProvider);
    final salesRepo = _ref.read(salesRepositoryProvider);
    final purchaseRepo = _ref.read(purchaseRepositoryProvider);
    final bankRepo = _ref.read(bankRepositoryProvider);
    final entries = await outboxRepo.loadPending();

    for (final entry in entries) {
      await Future<void>.delayed(const Duration(milliseconds: 150));
      final data = jsonDecode(entry.payload) as Map<String, dynamic>;
      final documentId = data['id'] as String?;
      if (documentId != null) {
        switch (entry.entity) {
          case 'sale':
            await salesRepo.updateStatus(id: documentId, status: 'sent');
            break;
          case 'purchase':
            await purchaseRepo.updateStatus(id: documentId, status: 'sent');
            break;
          case 'bank-movement':
            await bankRepo.updateMovementStatus(id: documentId, status: 'sent');
            break;
        }
      }
      await outboxRepo.markProcessed(entry.id);
    }
  }
}

final syncCoordinatorProvider = Provider<SyncCoordinator>((ref) {
  return SyncCoordinator(ref);
});
