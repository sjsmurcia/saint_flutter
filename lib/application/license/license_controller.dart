import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/license_info.dart';
import '../../domain/models/license_info_extensions.dart';
import '../../domain/repositories/license_repository.dart';
import 'license_state.dart';

class LicenseController extends StateNotifier<LicenseState> {
  LicenseController(this._repository) : super(const LicenseState.unknown()) {
    _restore();
  }

  final LicenseRepository _repository;

  Future<void> _restore() async {
    state = const LicenseState.loading();
    try {
      final info = await _repository.restore();
      if (info == null) {
        state = const LicenseState.inactive();
        return;
      }
      _apply(info);
    } catch (error) {
      state = LicenseState.error(
        'No fue posible restaurar la licencia: ${error.toString()}',
      );
    }
  }

  Future<void> activate(String licenseKey) async {
    state = const LicenseState.loading();
    try {
      final fingerprint = await _repository.deviceFingerprint();
      final info = await _repository.activate(
        licenseKey: licenseKey,
        deviceFingerprint: fingerprint,
      );
      _apply(info);
    } catch (error) {
      state = LicenseState.error(
        'Fallo la activacion de la licencia: ${error.toString()}',
      );
      rethrow;
    }
  }

  Future<void> checkIn({bool force = false}) async {
    final currentInfo = _extractInfo();
    if (currentInfo == null) {
      return;
    }
    if (!force && !currentInfo.requiresCheckIn) {
      return;
    }

    try {
      final fingerprint = await _repository.deviceFingerprint();
      final updated = await _repository.checkIn(
        token: currentInfo.token,
        deviceFingerprint: fingerprint,
      );
      _apply(updated);
    } catch (_) {
      // Mantener el estado actual pero marcando check-in pendiente
      state = state.maybeWhen(
        active: (info, _) => LicenseState.active(info, checkInDue: true),
        orElse: () => state,
      );
    }
  }

  Future<void> clear() async {
    await _repository.clear();
    state = const LicenseState.inactive();
  }

  LicenseInfo? _extractInfo() {
    return state.maybeWhen(
      active: (info, _) => info,
      expired: (info) => info,
      graceExpired: (info) => info,
      orElse: () => null,
    );
  }

  void _apply(LicenseInfo info) {
    if (info.isExpired) {
      state = LicenseState.expired(info);
      return;
    }
    if (info.isGraceExpired) {
      state = LicenseState.graceExpired(info);
      return;
    }
    state = LicenseState.active(info, checkInDue: info.requiresCheckIn);
  }
}
