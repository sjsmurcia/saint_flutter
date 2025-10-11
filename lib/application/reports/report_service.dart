import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../di/providers.dart';
import '../../domain/models/report_document.dart';
import '../../domain/models/report_file.dart';

class ReportService {
  ReportService(this._ref);

  final Ref _ref;
  Directory? _cachedReportsDir;

  Future<ReportDocument> downloadInvoice({required String documentId}) async {
    final contextData = _requireContext();
    final locale = Intl.getCurrentLocale();
    final repository = _ref.read(reportRepositoryProvider);

    final report = await repository.generateInvoice(
      tenantId: contextData.tenantId,
      token: contextData.authToken,
      licenseToken: contextData.licenseToken,
      documentId: documentId,
      locale: locale,
    );

    return _persistReport(report, type: 'invoice', referenceId: documentId);
  }

  Future<ReportDocument> downloadSalesPeriod({
    required DateTime from,
    required DateTime to,
  }) async {
    final contextData = _requireContext();
    final locale = Intl.getCurrentLocale();
    final repository = _ref.read(reportRepositoryProvider);

    final report = await repository.generateSalesPeriod(
      tenantId: contextData.tenantId,
      token: contextData.authToken,
      licenseToken: contextData.licenseToken,
      from: from,
      to: to,
      locale: locale,
    );

    return _persistReport(
      report,
      type: 'sales-period',
      referenceId: '${from.toIso8601String()}_${to.toIso8601String()}',
    );
  }

  Future<List<ReportDocument>> loadSavedReports() async {
    final directory = await _ensureReportsDir();
    if (!await directory.exists()) {
      return const [];
    }

    final files =
        directory
            .listSync()
            .whereType<File>()
            .where((file) => file.path.toLowerCase().endsWith('.pdf'))
            .toList()
          ..sort(
            (a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()),
          );

    final documents = <ReportDocument>[];
    for (final file in files) {
      final stats = await file.stat();
      documents.add(
        ReportDocument(
          id: file.path,
          name: p.basename(file.path),
          path: file.path,
          downloadedAt: stats.modified,
          type: _inferType(file.path),
          contentType: 'application/pdf',
        ),
      );
    }
    return documents;
  }

  Future<void> deleteReport(String path) async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<ReportDocument> _persistReport(
    ReportFile report, {
    required String type,
    String? referenceId,
  }) async {
    final directory = await _ensureReportsDir();
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    final safeName = _uniqueName(report.fileName);
    final file = File(p.join(directory.path, safeName));
    await file.writeAsBytes(report.bytes, flush: true);

    final now = DateTime.now();
    return ReportDocument(
      id: file.path,
      name: safeName,
      path: file.path,
      downloadedAt: now,
      type: type,
      referenceId: referenceId,
      contentType: report.contentType,
    );
  }

  Future<Directory> _ensureReportsDir() async {
    if (_cachedReportsDir != null) {
      return _cachedReportsDir!;
    }
    final baseDir = await getApplicationDocumentsDirectory();
    _cachedReportsDir = Directory(p.join(baseDir.path, 'reports'));
    return _cachedReportsDir!;
  }

  String _uniqueName(String fileName) {
    final sanitized = fileName.replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final extension = p.extension(sanitized);
    final base = p.basenameWithoutExtension(sanitized);
    return '${base}_$timestamp$extension';
  }

  String _inferType(String path) {
    final name = p.basename(path).toLowerCase();
    if (name.startsWith('invoice')) {
      return 'invoice';
    }
    if (name.startsWith('sales')) {
      return 'sales-period';
    }
    return 'report';
  }

  _ReportContext _requireContext() {
    final authState = _ref.read(authControllerProvider);
    final session = authState.maybeWhen(
      authenticated: (session) => session,
      orElse: () => null,
    );
    if (session == null) {
      throw StateError('No hay sesion activa');
    }

    final licenseState = _ref.read(licenseControllerProvider);
    final licenseToken = licenseState.maybeWhen(
      active: (info, _) => info.token,
      orElse: () => null,
    );
    if (licenseToken == null) {
      throw StateError('La licencia no esta activa');
    }

    return _ReportContext(
      authToken: session.token,
      licenseToken: licenseToken,
      tenantId: session.tenantId,
    );
  }
}

class _ReportContext {
  _ReportContext({
    required this.authToken,
    required this.licenseToken,
    required this.tenantId,
  });

  final String authToken;
  final String licenseToken;
  final String tenantId;
}
