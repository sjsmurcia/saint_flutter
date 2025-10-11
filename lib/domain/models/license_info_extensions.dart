import 'license_info.dart';

extension LicenseInfoX on LicenseInfo {
  DateTime get graceDeadline =>
      lastCheckInAt.add(Duration(days: graceDays));

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  bool get isGraceExpired => DateTime.now().isAfter(graceDeadline);

  bool get requiresCheckIn =>
      DateTime.now().isAfter(
        lastCheckInAt.add(Duration(days: checkIntervalDays)),
      );

  bool allows(String entitlement) =>
      entitlements.any(
        (value) => value.toLowerCase() == entitlement.toLowerCase(),
      );
}
