import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_info.freezed.dart';
part 'license_info.g.dart';

@freezed
class LicenseInfo with _$LicenseInfo {
  const factory LicenseInfo({
    required String token,
    required String licenseId,
    required String tenantId,
    required String licenseType,
    required List<String> entitlements,
    required DateTime issuedAt,
    required DateTime expiresAt,
    required DateTime lastCheckInAt,
    required int checkIntervalDays,
    required int graceDays,
  }) = _LicenseInfo;

  factory LicenseInfo.fromJson(Map<String, dynamic> json) =>
      _$LicenseInfoFromJson(json);
}
