import '../models/report_file.dart';

abstract class ReportRepository {
  Future<ReportFile> generateInvoice({
    required String tenantId,
    required String token,
    required String licenseToken,
    required String documentId,
    String format = 'pdf',
    String? locale,
  });

  Future<ReportFile> generateSalesPeriod({
    required String tenantId,
    required String token,
    required String licenseToken,
    required DateTime from,
    required DateTime to,
    String format = 'pdf',
    String? locale,
  });
}


