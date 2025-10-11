import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

import '../../domain/models/report_file.dart';
import '../../domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  ReportRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<ReportFile> generateInvoice({
    required String tenantId,
    required String token,
    required String licenseToken,
    required String documentId,
    String format = 'pdf',
    String? locale,
  }) {
    return _postReport(
      path: '/reports/invoice',
      token: token,
      licenseToken: licenseToken,
      payload: {
        'tenantId': tenantId,
        'documentId': documentId,
        'format': format,
        'locale': locale,
      },
      fallbackName: 'invoice_${_sanitize(documentId)}.$format',
    );
  }

  @override
  Future<ReportFile> generateSalesPeriod({
    required String tenantId,
    required String token,
    required String licenseToken,
    required DateTime from,
    required DateTime to,
    String format = 'pdf',
    String? locale,
  }) {
    return _postReport(
      path: '/reports/sales-period',
      token: token,
      licenseToken: licenseToken,
      payload: {
        'tenantId': tenantId,
        'from': from.toIso8601String(),
        'to': to.toIso8601String(),
        'format': format,
        'locale': locale,
      },
      fallbackName:
          'sales_${from.toIso8601String()}_${to.toIso8601String()}.$format',
    );
  }

  Future<ReportFile> _postReport({
    required String path,
    required String token,
    required String licenseToken,
    required Map<String, dynamic> payload,
    required String fallbackName,
  }) async {
    try {
      final response = await _dio.post<List<int>>(
        path,
        data: payload,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': 'Bearer $token',
            'X-License-Token': licenseToken,
            'Content-Type': 'application/json',
            'Accept': 'application/pdf',
          },
        ),
      );

      final data = response.data;
      if (data == null || data.isEmpty) {
        throw StateError('Respuesta vacia del servicio de reportes');
      }

      final fileName = _resolveFileName(response) ?? fallbackName;
      final contentType =
          response.headers.value('content-type') ?? 'application/pdf';

      return ReportFile(
        fileName: fileName,
        bytes: data,
        contentType: contentType,
      );
    } on DioException catch (error) {
      final message =
          error.response?.statusMessage ??
          error.message ??
          'Fallo en la peticion de reporte';
      throw StateError(message);
    }
  }

  String? _resolveFileName(Response<dynamic> response) {
    final disposition = response.headers.value('content-disposition');
    if (disposition == null) {
      return null;
    }

    final match = RegExp(r'filename="?([^";]+)"?').firstMatch(disposition);
    final rawName = match?.group(1);
    if (rawName == null) {
      return null;
    }

    return p.basename(rawName);
  }

  String _sanitize(String input) {
    return input.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');
  }
}
