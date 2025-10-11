import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/license_info.dart';

part 'license_state.freezed.dart';

@freezed
class LicenseState with _$LicenseState {
  const factory LicenseState.unknown() = LicenseStateUnknown;
  const factory LicenseState.loading() = LicenseStateLoading;
  const factory LicenseState.inactive() = LicenseStateInactive;
  const factory LicenseState.active(
    LicenseInfo info, {
    @Default(false) bool checkInDue,
  }) = LicenseStateActive;
  const factory LicenseState.expired(LicenseInfo info) = LicenseStateExpired;
  const factory LicenseState.graceExpired(LicenseInfo info) =
      LicenseStateGraceExpired;
  const factory LicenseState.error(String message) = LicenseStateError;
}
