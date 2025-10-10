import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Saint'**
  String get appTitle;

  /// No description provided for @logoutTooltip.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get logoutTooltip;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get emailInvalid;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordShort.
  ///
  /// In en, this message translates to:
  /// **'Minimum 4 characters'**
  String get passwordShort;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get loginButton;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get homeTitle;

  /// No description provided for @tenantLabel.
  ///
  /// In en, this message translates to:
  /// **'Tenant'**
  String get tenantLabel;

  /// No description provided for @catalogSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Catalogs'**
  String get catalogSectionTitle;

  /// No description provided for @productsTitle.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsTitle;

  /// No description provided for @productsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View and sync the offline catalog'**
  String get productsSubtitle;

  /// No description provided for @clientsTitle.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get clientsTitle;

  /// No description provided for @clientsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Offline ready with sync'**
  String get clientsSubtitle;

  /// No description provided for @salesTitle.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get salesTitle;

  /// No description provided for @salesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Capture tickets offline'**
  String get salesSubtitle;

  /// No description provided for @salesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No sales recorded yet'**
  String get salesEmpty;

  /// No description provided for @createSaleButton.
  ///
  /// In en, this message translates to:
  /// **'Register sale'**
  String get createSaleButton;

  /// No description provided for @purchasesTitle.
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get purchasesTitle;

  /// No description provided for @purchasesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Capture supplier docs offline'**
  String get purchasesSubtitle;

  /// No description provided for @purchasesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No purchases recorded yet'**
  String get purchasesEmpty;

  /// No description provided for @createPurchaseButton.
  ///
  /// In en, this message translates to:
  /// **'Register purchase'**
  String get createPurchaseButton;

  /// No description provided for @productsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No products synced yet'**
  String get productsEmpty;

  /// No description provided for @clientsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No clients synced yet'**
  String get clientsEmpty;

  /// No description provided for @outboxTitle.
  ///
  /// In en, this message translates to:
  /// **'Pending sync'**
  String get outboxTitle;

  /// No description provided for @outboxEmpty.
  ///
  /// In en, this message translates to:
  /// **'No pending documents'**
  String get outboxEmpty;

  /// No description provided for @documentTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total amount'**
  String get documentTotalLabel;

  /// No description provided for @documentStatusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get documentStatusDraft;

  /// No description provided for @documentStatusSent.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get documentStatusSent;

  /// No description provided for @documentCreatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Document saved and queued for sync'**
  String get documentCreatedMessage;

  /// No description provided for @companySelectorTitle.
  ///
  /// In en, this message translates to:
  /// **'Select company and branch'**
  String get companySelectorTitle;

  /// No description provided for @companyLabel.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get companyLabel;

  /// No description provided for @branchLabel.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get branchLabel;

  /// No description provided for @companySelectorEmpty.
  ///
  /// In en, this message translates to:
  /// **'No companies available'**
  String get companySelectorEmpty;

  /// No description provided for @companySelectorTooltip.
  ///
  /// In en, this message translates to:
  /// **'Change company'**
  String get companySelectorTooltip;

  /// No description provided for @backgroundSyncEnabled.
  ///
  /// In en, this message translates to:
  /// **'Background sync enabled'**
  String get backgroundSyncEnabled;

  /// No description provided for @manualSyncButton.
  ///
  /// In en, this message translates to:
  /// **'Sync now'**
  String get manualSyncButton;

  /// No description provided for @workmanagerError.
  ///
  /// In en, this message translates to:
  /// **'Background sync failed'**
  String get workmanagerError;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get fieldRequired;

  /// No description provided for @invalidAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid amount'**
  String get invalidAmount;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get genericError;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @banksTitle.
  ///
  /// In en, this message translates to:
  /// **'Banks'**
  String get banksTitle;

  /// No description provided for @banksEmpty.
  ///
  /// In en, this message translates to:
  /// **'No bank accounts yet'**
  String get banksEmpty;

  /// No description provided for @bankAccountLabel.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get bankAccountLabel;

  /// No description provided for @registerMovement.
  ///
  /// In en, this message translates to:
  /// **'Register movement'**
  String get registerMovement;

  /// No description provided for @movementDeposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get movementDeposit;

  /// No description provided for @movementWithdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get movementWithdraw;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @banksSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track cash flow offline'**
  String get banksSubtitle;

  /// No description provided for @movementTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get movementTypeLabel;

  /// No description provided for @movementDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get movementDescriptionLabel;

  /// No description provided for @movementsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No movements recorded'**
  String get movementsEmpty;

  /// No description provided for @reportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportsTitle;

  /// No description provided for @reportsInvoiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get reportsInvoiceTitle;

  /// No description provided for @invoiceIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Invoice number'**
  String get invoiceIdLabel;

  /// No description provided for @reportInvoicePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Example: INV-1001'**
  String get reportInvoicePlaceholder;

  /// No description provided for @generateInvoiceButton.
  ///
  /// In en, this message translates to:
  /// **'Generate invoice'**
  String get generateInvoiceButton;

  /// No description provided for @reportsSalesPeriodTitle.
  ///
  /// In en, this message translates to:
  /// **'Sales by period'**
  String get reportsSalesPeriodTitle;

  /// No description provided for @selectRangeButton.
  ///
  /// In en, this message translates to:
  /// **'Select range'**
  String get selectRangeButton;

  /// No description provided for @generateSalesPeriodButton.
  ///
  /// In en, this message translates to:
  /// **'Generate sales report'**
  String get generateSalesPeriodButton;

  /// No description provided for @reportsHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Downloaded reports'**
  String get reportsHistoryTitle;

  /// No description provided for @reportsHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No reports downloaded yet'**
  String get reportsHistoryEmpty;

  /// No description provided for @reportDownloadSuccess.
  ///
  /// In en, this message translates to:
  /// **'Report downloaded'**
  String get reportDownloadSuccess;

  /// No description provided for @reportDownloadError.
  ///
  /// In en, this message translates to:
  /// **'Could not generate the report'**
  String get reportDownloadError;

  /// No description provided for @reportOpenError.
  ///
  /// In en, this message translates to:
  /// **'Could not open the file'**
  String get reportOpenError;

  /// No description provided for @reportShareError.
  ///
  /// In en, this message translates to:
  /// **'Could not share the file'**
  String get reportShareError;

  /// No description provided for @reportDeleted.
  ///
  /// In en, this message translates to:
  /// **'Report deleted'**
  String get reportDeleted;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
