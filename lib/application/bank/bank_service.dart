import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/providers.dart';

class BankService {
  BankService(this._ref);

  final Ref _ref;

  Future<void> registerMovement({
    required String accountId,
    required double amount,
    required String type,
    String? description,
    required DateTime occurredAt,
  }) async {
    final session = _ref
        .read(authControllerProvider)
        .maybeWhen(authenticated: (session) => session, orElse: () => null);
    if (session == null) {
      throw StateError('No hay sesion activa');
    }

    await _ref
        .read(bankRepositoryProvider)
        .registerMovement(
          tenantId: session.tenantId,
          accountId: accountId,
          amount: amount,
          type: type,
          description: description,
          occurredAt: occurredAt,
        );
  }
}

final bankServiceProvider = Provider<BankService>((ref) => BankService(ref));
