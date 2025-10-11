import 'dart:convert';

import 'package:jose/jose.dart';

import '../domain/models/license_info.dart';

class LicenseTokenDecoder {
  LicenseTokenDecoder(String publicKeyPem)
      : _key = JsonWebKey.fromPem(publicKeyPem, keyId: 'saint-license-public');

  final JsonWebKey _key;

  Future<LicenseInfo> decode(String token) async {
    final jwt = JsonWebToken.unverified(token);
    final keyStore = JsonWebKeyStore()..addKey(_key);
    final isValid = await jwt.verify(
      keyStore,
      allowedArguments: const ['RS256'],
    );
    if (!isValid) {
      throw StateError('Token de licencia con firma invalida');
    }

    final claims = jwt.claims.toJson();
    final entitlements = _parseEntitlements(claims['entitlements']);

    final exp = _readEpoch(claims['exp']);
    final iat = _readEpoch(claims['iat']);
    final lastCheckIn = _parseDateTime(claims['last_check_in']) ?? iat;

    final checkIntervalDays = _parseInt(claims['check_interval_days']);
    final graceDays = _parseInt(claims['grace_days']);

    final licenseId =
        (claims['license_id'] ?? claims['sub'] ?? '') as String? ?? '';
    final tenantId = (claims['tenant_id'] ?? '') as String? ?? '';
    final licenseType = (claims['license_type'] ?? '') as String? ?? '';

    if (licenseId.isEmpty || tenantId.isEmpty) {
      throw StateError('Token de licencia incompleto');
    }

    return LicenseInfo(
      token: token,
      licenseId: licenseId,
      tenantId: tenantId,
      licenseType: licenseType,
      entitlements: entitlements,
      issuedAt: iat,
      expiresAt: exp,
      lastCheckInAt: lastCheckIn,
      checkIntervalDays: checkIntervalDays,
      graceDays: graceDays,
    );
  }

  List<String> _parseEntitlements(dynamic raw) {
    if (raw is List) {
      return raw.map((value) => value.toString()).toList();
    }
    if (raw is String && raw.isNotEmpty) {
      final decoded = jsonDecode(raw);
      if (decoded is List) {
        return decoded.map((value) => value.toString()).toList();
      }
    }
    return const [];
  }

  DateTime _readEpoch(dynamic value) {
    if (value is num) {
      return DateTime.fromMillisecondsSinceEpoch(
        (value * 1000).toInt(),
        isUtc: true,
      );
    }
    if (value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null) {
        return DateTime.fromMillisecondsSinceEpoch(
          parsed * 1000,
          isUtc: true,
        );
      }
      final dt = _parseDateTime(value);
      if (dt != null) {
        return dt;
      }
    }
    return DateTime.now().toUtc();
  }

  int _parseInt(dynamic value) {
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  DateTime? _parseDateTime(dynamic value) {
    if (value is String && value.isNotEmpty) {
      return DateTime.tryParse(value)?.toUtc();
    }
    return null;
  }
}
