// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Saint';

  @override
  String get logoutTooltip => 'Sign out';

  @override
  String get loginTitle => 'Sign in';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Enter a valid email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordShort => 'Minimum 4 characters';

  @override
  String get loginButton => 'Continue';

  @override
  String get homeTitle => 'Dashboard';

  @override
  String get tenantLabel => 'Tenant';

  @override
  String get catalogSectionTitle => 'Catalogs';

  @override
  String get productsTitle => 'Products';

  @override
  String get productsSubtitle => 'View and sync the offline catalog';

  @override
  String get clientsTitle => 'Clients';

  @override
  String get clientsSubtitle => 'Offline ready with sync';

  @override
  String get salesTitle => 'Sales';

  @override
  String get salesSubtitle => 'Capture tickets offline';

  @override
  String get salesEmpty => 'No sales recorded yet';

  @override
  String get createSaleButton => 'Register sale';

  @override
  String get purchasesTitle => 'Purchases';

  @override
  String get purchasesSubtitle => 'Capture supplier docs offline';

  @override
  String get purchasesEmpty => 'No purchases recorded yet';

  @override
  String get createPurchaseButton => 'Register purchase';

  @override
  String get productsEmpty => 'No products synced yet';

  @override
  String get clientsEmpty => 'No clients synced yet';

  @override
  String get outboxTitle => 'Pending sync';

  @override
  String get outboxEmpty => 'No pending documents';

  @override
  String get documentTotalLabel => 'Total amount';

  @override
  String get documentStatusDraft => 'Draft';

  @override
  String get documentStatusSent => 'Synced';

  @override
  String get documentCreatedMessage => 'Document saved and queued for sync';

  @override
  String get companySelectorTitle => 'Select company and branch';

  @override
  String get companyLabel => 'Company';

  @override
  String get branchLabel => 'Branch';

  @override
  String get companySelectorEmpty => 'No companies available';

  @override
  String get companySelectorTooltip => 'Change company';

  @override
  String get backgroundSyncEnabled => 'Background sync enabled';

  @override
  String get manualSyncButton => 'Sync now';

  @override
  String get workmanagerError => 'Background sync failed';

  @override
  String get fieldRequired => 'Required field';

  @override
  String get invalidAmount => 'Enter a valid amount';

  @override
  String get close => 'Close';

  @override
  String get genericError => 'Something went wrong';

  @override
  String get retry => 'Try again';

  @override
  String get banksTitle => 'Banks';

  @override
  String get banksEmpty => 'No bank accounts yet';

  @override
  String get bankAccountLabel => 'Account';

  @override
  String get registerMovement => 'Register movement';

  @override
  String get movementDeposit => 'Deposit';

  @override
  String get movementWithdraw => 'Withdrawal';

  @override
  String get save => 'Save';

  @override
  String get banksSubtitle => 'Track cash flow offline';

  @override
  String get movementTypeLabel => 'Type';

  @override
  String get movementDescriptionLabel => 'Description';

  @override
  String get movementsEmpty => 'No movements recorded';

  @override
  String get reportsTitle => 'Reports';

  @override
  String get reportsInvoiceTitle => 'Invoice';

  @override
  String get invoiceIdLabel => 'Invoice number';

  @override
  String get reportInvoicePlaceholder => 'Example: INV-1001';

  @override
  String get generateInvoiceButton => 'Generate invoice';

  @override
  String get reportsSalesPeriodTitle => 'Sales by period';

  @override
  String get selectRangeButton => 'Select range';

  @override
  String get generateSalesPeriodButton => 'Generate sales report';

  @override
  String get reportsHistoryTitle => 'Downloaded reports';

  @override
  String get reportsHistoryEmpty => 'No reports downloaded yet';

  @override
  String get reportDownloadSuccess => 'Report downloaded';

  @override
  String get reportDownloadError => 'Could not generate the report';

  @override
  String get reportOpenError => 'Could not open the file';

  @override
  String get reportShareError => 'Could not share the file';

  @override
  String get reportDeleted => 'Report deleted';

  @override
  String get open => 'Open';

  @override
  String get share => 'Share';

  @override
  String get delete => 'Delete';
}
