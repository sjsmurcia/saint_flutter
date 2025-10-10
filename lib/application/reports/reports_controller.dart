import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/providers.dart';
import '../../domain/models/report_document.dart';

class ReportsController
    extends StateNotifier<AsyncValue<List<ReportDocument>>> {
  ReportsController(this._ref) : super(const AsyncLoading()) {
    _load();
  }

  final Ref _ref;

  Future<void> refresh() async {
    await _load();
  }

  Future<void> downloadInvoice({required String documentId}) async {
    final previous = state;
    state = const AsyncLoading<List<ReportDocument>>().copyWithPrevious(
      previous,
    );
    try {
      await _ref
          .read(reportServiceProvider)
          .downloadInvoice(documentId: documentId);
      final reports = await _ref.read(reportServiceProvider).loadSavedReports();
      state = AsyncData(reports);
    } catch (error, stack) {
      state = AsyncError(error, stack);
      rethrow;
    }
  }

  Future<void> downloadSalesPeriod({
    required DateTime from,
    required DateTime to,
  }) async {
    final previous = state;
    state = const AsyncLoading<List<ReportDocument>>().copyWithPrevious(
      previous,
    );
    try {
      await _ref
          .read(reportServiceProvider)
          .downloadSalesPeriod(from: from, to: to);
      final reports = await _ref.read(reportServiceProvider).loadSavedReports();
      state = AsyncData(reports);
    } catch (error, stack) {
      state = AsyncError(error, stack);
      rethrow;
    }
  }

  Future<void> deleteReport(String path) async {
    await _ref.read(reportServiceProvider).deleteReport(path);
    await _load();
  }

  Future<void> _load() async {
    try {
      final reports = await _ref.read(reportServiceProvider).loadSavedReports();
      state = AsyncData(reports);
    } catch (error, stack) {
      state = AsyncError(error, stack);
    }
  }
}
