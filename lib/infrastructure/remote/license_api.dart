import 'package:dio/dio.dart';

class LicenseApi {
  LicenseApi(this._dio);

  final Dio _dio;

  Future<LicenseServerResponse> activate({
    required String licenseKey,
    String? deviceFingerprint,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/licenses/activate',
        data: {
          'licenseKey': licenseKey,
          if (deviceFingerprint != null) 'deviceFingerprint': deviceFingerprint,
        },
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Respuesta vacia del servicio de licencias');
      }
      return LicenseServerResponse.fromJson(data);
    } on DioException catch (error) {
      final message =
          error.response?.data is Map<String, dynamic>
              ? (error.response!.data['title'] as String?) ??
                  error.response!.data['detail'] as String? ??
                  error.message
              : error.message;
      throw StateError(message ?? 'Fallo al activar licencia');
    }
  }

  Future<LicenseServerResponse> checkIn({
    required String licenseToken,
    String? deviceFingerprint,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/licenses/checkin',
        data: {
          'licenseToken': licenseToken,
          if (deviceFingerprint != null) 'deviceFingerprint': deviceFingerprint,
        },
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Respuesta vacia del servicio de licencias');
      }
      return LicenseServerResponse.fromJson(data);
    } on DioException catch (error) {
      final message =
          error.response?.data is Map<String, dynamic>
              ? (error.response!.data['title'] as String?) ??
                  error.response!.data['detail'] as String? ??
                  error.message
              : error.message;
      throw StateError(message ?? 'Fallo al validar licencia');
    }
  }
}

class LicenseServerResponse {
  LicenseServerResponse({
    required this.licenseToken,
    required this.licenseId,
    required this.tenantId,
    required this.licenseType,
    required this.entitlements,
    required this.expiresAtUtc,
    required this.graceDays,
    required this.checkIntervalDays,
    required this.lastCheckInUtc,
  });

  factory LicenseServerResponse.fromJson(Map<String, dynamic> json) {
    final entitlements = (json['entitlements'] as List<dynamic>? ?? [])
        .map((value) => value.toString())
        .toList();
    final expiresAtRaw = json['expiresAtUtc'] ?? json['expiresAt'];
    final lastCheckInRaw = json['lastCheckInUtc'] ?? json['lastCheckIn'];

    return LicenseServerResponse(
      licenseToken: json['licenseToken'] as String,
      licenseId: json['licenseId'] as String,
      tenantId: json['tenantId'] as String,
      licenseType: json['licenseType'] as String,
      entitlements: entitlements,
      expiresAtUtc: DateTime.parse(expiresAtRaw as String).toUtc(),
      graceDays: (json['graceDays'] as num).toInt(),
      checkIntervalDays: (json['checkIntervalDays'] as num).toInt(),
      lastCheckInUtc: DateTime.parse(lastCheckInRaw as String).toUtc(),
    );
  }

  final String licenseToken;
  final String licenseId;
  final String tenantId;
  final String licenseType;
  final List<String> entitlements;
  final DateTime expiresAtUtc;
  final int graceDays;
  final int checkIntervalDays;
  final DateTime lastCheckInUtc;
}
