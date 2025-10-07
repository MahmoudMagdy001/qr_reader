import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'QR Generator'**
  String get appTitle;

  /// No description provided for @languageText.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageText;

  /// No description provided for @themeText.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeText;

  /// No description provided for @loginText.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginText;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @enterYourPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterYourPhone;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgetPassword;

  /// No description provided for @loginCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginCreateAccount;

  /// No description provided for @loginCreateButton.
  ///
  /// In en, this message translates to:
  /// **'Create one'**
  String get loginCreateButton;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginError;

  /// No description provided for @signupText.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupText;

  /// No description provided for @successCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully!'**
  String get successCreateAccount;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password you provided is too weak.'**
  String get weakPassword;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'An account already exists with this email.'**
  String get emailAlreadyInUse;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address.'**
  String get invalidEmail;

  /// No description provided for @signupError.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed. Please try again.'**
  String get signupError;

  /// No description provided for @userDisabled.
  ///
  /// In en, this message translates to:
  /// **'This user account has been disabled.'**
  String get userDisabled;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'No user found with this email address.'**
  String get userNotFound;

  /// No description provided for @wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password.'**
  String get wrongPassword;

  /// No description provided for @requiredEmail.
  ///
  /// In en, this message translates to:
  /// **'Email is required.'**
  String get requiredEmail;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get enterValidEmail;

  /// No description provided for @requiredPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is required.'**
  String get requiredPassword;

  /// No description provided for @enterValidPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long.'**
  String get enterValidPassword;

  /// No description provided for @requiredPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required.'**
  String get requiredPhone;

  /// No description provided for @enterValidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get enterValidPhone;

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanTitle;

  /// No description provided for @scanText1.
  ///
  /// In en, this message translates to:
  /// **'Place the QR code inside the frame to scan.'**
  String get scanText1;

  /// No description provided for @scanText2.
  ///
  /// In en, this message translates to:
  /// **'Hold your device steady for quicker results.'**
  String get scanText2;

  /// No description provided for @scanningQr.
  ///
  /// In en, this message translates to:
  /// **'Scanning code...'**
  String get scanningQr;

  /// No description provided for @scanButton.
  ///
  /// In en, this message translates to:
  /// **'Open camera to scan'**
  String get scanButton;

  /// No description provided for @resultTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan Result'**
  String get resultTitle;

  /// No description provided for @resultText1.
  ///
  /// In en, this message translates to:
  /// **'ProReader keeps your last 10 days of scan history.'**
  String get resultText1;

  /// No description provided for @resultText2.
  ///
  /// In en, this message translates to:
  /// **'To save your complete scan history, please'**
  String get resultText2;

  /// No description provided for @resultText3.
  ///
  /// In en, this message translates to:
  /// **'purchase our Pro package.'**
  String get resultText3;

  /// No description provided for @resultButton.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get resultButton;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
