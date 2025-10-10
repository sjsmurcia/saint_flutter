import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';

import '../../../di/providers.dart';
import '../../../domain/models/report_document.dart';
import '../../../gen_l10n/app_localizations.dart';
import '../../widgets/app_scaffold.dart';

class ReportsPage extends ConsumerStatefulWidget {
  const ReportsPage({super.key});

  @override
  ConsumerState<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends ConsumerState<ReportsPage> {
  final TextEditingController _invoiceController = TextEditingController();
  DateTimeRange? _selectedRange;
  bool _invoiceLoading = false;
  bool _salesLoading = false;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedRange = DateTimeRange(
      start: now.subtract(const Duration(days: 7)),
      end: now,
    );
  }

  @override
  void dispose() {
    _invoiceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final reportsState = ref.watch(reportsControllerProvider);

    return AppScaffold(
      title: l10n?.reportsTitle ?? 'Reportes',
      child: RefreshIndicator(
        onRefresh: () => ref.read(reportsControllerProvider.notifier).refresh(),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildInvoiceCard(context, l10n),
            const SizedBox(height: 16),
            _buildSalesCard(context, l10n),
            const SizedBox(height: 24),
            Text(
              l10n?.reportsHistoryTitle ?? 'Reportes descargados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            reportsState.when(
              data: (reports) => reports.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: Text(
                          l10n?.reportsHistoryEmpty ?? 'Sin descargas previas',
                        ),
                      ),
                    )
                  : Column(
                      children: reports
                          .map(
                            (report) => _ReportTile(
                              report: report,
                              onOpen: () => _openReport(context, report, l10n),
                              onShare: () =>
                                  _shareReport(context, report, l10n),
                              onDelete: () =>
                                  _deleteReport(context, report, l10n),
                            ),
                          )
                          .toList(),
                    ),
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  children: [
                    Text(l10n?.genericError ?? 'Ocurrio un error'),
                    const SizedBox(height: 8),
                    Text(error.toString()),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => ref
                          .read(reportsControllerProvider.notifier)
                          .refresh(),
                      child: Text(l10n?.retry ?? 'Reintentar'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceCard(BuildContext context, AppLocalizations? l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n?.reportsInvoiceTitle ?? 'Factura',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _invoiceController,
              decoration: InputDecoration(
                labelText: l10n?.invoiceIdLabel ?? 'Folio de factura',
                hintText: l10n?.reportInvoicePlaceholder ?? 'Ejemplo: FAC-1001',
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _invoiceLoading
                  ? null
                  : () => _generateInvoice(context, l10n),
              icon: _invoiceLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.picture_as_pdf_outlined),
              label: Text(l10n?.generateInvoiceButton ?? 'Generar factura'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesCard(BuildContext context, AppLocalizations? l10n) {
    final rangeLabel = _selectedRange == null
        ? l10n?.selectRangeButton ?? 'Seleccionar periodo'
        : '${DateFormat.yMMMd().format(_selectedRange!.start)} - ${DateFormat.yMMMd().format(_selectedRange!.end)}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n?.reportsSalesPeriodTitle ?? 'Ventas por periodo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.date_range_outlined),
              title: Text(rangeLabel),
              onTap: _invoiceLoading || _salesLoading
                  ? null
                  : () => _pickRange(context, l10n),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: (_salesLoading || _selectedRange == null)
                  ? null
                  : () => _generateSalesReport(context, l10n),
              icon: _salesLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.insert_drive_file_outlined),
              label: Text(
                l10n?.generateSalesPeriodButton ?? 'Generar reporte de ventas',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generateInvoice(
    BuildContext context,
    AppLocalizations? l10n,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final documentId = _invoiceController.text.trim();
    if (documentId.isEmpty) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n?.fieldRequired ?? 'Campo requerido')),
      );
      return;
    }

    setState(() => _invoiceLoading = true);
    try {
      await ref
          .read(reportsControllerProvider.notifier)
          .downloadInvoice(documentId: documentId);
      messenger.showSnackBar(
        SnackBar(
          content: Text(l10n?.reportDownloadSuccess ?? 'Reporte descargado'),
        ),
      );
    } catch (error) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n?.reportDownloadError ?? error.toString())),
      );
    } finally {
      if (mounted) {
        setState(() => _invoiceLoading = false);
      }
    }
  }

  Future<void> _generateSalesReport(
    BuildContext context,
    AppLocalizations? l10n,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final range = _selectedRange;
    if (range == null) {
      return;
    }

    setState(() => _salesLoading = true);
    try {
      await ref
          .read(reportsControllerProvider.notifier)
          .downloadSalesPeriod(from: range.start, to: range.end);
      messenger.showSnackBar(
        SnackBar(
          content: Text(l10n?.reportDownloadSuccess ?? 'Reporte descargado'),
        ),
      );
    } catch (error) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n?.reportDownloadError ?? error.toString())),
      );
    } finally {
      if (mounted) {
        setState(() => _salesLoading = false);
      }
    }
  }

  Future<void> _pickRange(BuildContext context, AppLocalizations? l10n) async {
    final now = DateTime.now();
    final initialRange =
        _selectedRange ??
        DateTimeRange(start: now.subtract(const Duration(days: 7)), end: now);
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 1),
      initialDateRange: initialRange,
      helpText: l10n?.selectRangeButton ?? 'Seleccionar periodo',
    );
    if (!mounted) {
      return;
    }
    if (range != null) {
      setState(() => _selectedRange = range);
    }
  }

  Future<void> _openReport(
    BuildContext context,
    ReportDocument report,
    AppLocalizations? l10n,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final result = await OpenFilex.open(report.path);
    if (result.type != ResultType.done) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(l10n?.reportOpenError ?? 'No se pudo abrir el archivo'),
        ),
      );
    }
  }

  Future<void> _shareReport(
    BuildContext context,
    ReportDocument report,
    AppLocalizations? l10n,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await Share.shareXFiles([XFile(report.path)], text: report.name);
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            l10n?.reportShareError ?? 'No se pudo compartir el archivo',
          ),
        ),
      );
    }
  }

  Future<void> _deleteReport(
    BuildContext context,
    ReportDocument report,
    AppLocalizations? l10n,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    await ref
        .read(reportsControllerProvider.notifier)
        .deleteReport(report.path);
    messenger.showSnackBar(
      SnackBar(content: Text(l10n?.reportDeleted ?? 'Reporte eliminado')),
    );
  }
}

class _ReportTile extends StatelessWidget {
  const _ReportTile({
    required this.report,
    required this.onOpen,
    required this.onShare,
    required this.onDelete,
  });

  final ReportDocument report;
  final VoidCallback onOpen;
  final VoidCallback onShare;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final subtitle = _subtitleForReport(report);
    return Card(
      child: ListTile(
        title: Text(report.name),
        subtitle: Text(subtitle),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined),
              tooltip: AppLocalizations.of(context)?.open ?? 'Abrir',
              onPressed: onOpen,
            ),
            IconButton(
              icon: const Icon(Icons.ios_share),
              tooltip: AppLocalizations.of(context)?.share ?? 'Compartir',
              onPressed: onShare,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: AppLocalizations.of(context)?.delete ?? 'Eliminar',
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }

  String _subtitleForReport(ReportDocument report) {
    final formatted = DateFormat.yMMMd().add_Hm().format(
      report.downloadedAt.toLocal(),
    );
    return '${report.type} - $formatted';
  }
}
