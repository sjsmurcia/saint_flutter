import '../models/license_info.dart';

abstract class LicenseRepository {
  Future<LicenseInfo?> restore();
  Future<void> persist(LicenseInfo info);
  Future<void> clear();

  Future<String> deviceFingerprint();

  Future<LicenseInfo> activate({
    required String licenseKey,
    String? deviceFingerprint,
  });

  Future<LicenseInfo> checkIn({
    required String token,
    String? deviceFingerprint,
  });
}
