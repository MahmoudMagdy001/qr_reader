// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'QR Generator';

  @override
  String get languageText => 'Language';

  @override
  String get themeText => 'Theme';

  @override
  String get loginText => 'Login';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get enterYourPhone => 'Enter your phone number';

  @override
  String get forgetPassword => 'Forgot your password?';

  @override
  String get loginCreateAccount => 'Don\'t have an account?';

  @override
  String get loginCreateButton => 'Create one';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get loginError => 'Login failed. Please try again.';

  @override
  String get signupText => 'Sign Up';

  @override
  String get successCreateAccount =>
      'Your account has been created successfully!';

  @override
  String get weakPassword => 'The password you entered is too weak.';

  @override
  String get emailAlreadyInUse => 'An account already exists with this email.';

  @override
  String get invalidEmail => 'Please enter a valid email address.';

  @override
  String get signupError => 'Sign-up failed. Please try again.';

  @override
  String get userDisabled => 'This user account has been disabled.';

  @override
  String get userNotFound => 'No user found with this email address.';

  @override
  String get wrongPassword => 'Incorrect password.';

  @override
  String get requiredEmail => 'Email is required.';

  @override
  String get enterValidEmail => 'Please enter a valid email address.';

  @override
  String get requiredPassword => 'Password is required.';

  @override
  String get enterValidPassword =>
      'Password must be at least 6 characters long.';

  @override
  String get requiredPhone => 'Phone number is required.';

  @override
  String get enterValidPhone => 'Please enter a valid phone number.';

  @override
  String get scanTitle => 'Scan QR Code';

  @override
  String get scanText1 =>
      'Place the QR code inside the frame to start scanning.';

  @override
  String get scanText2 =>
      'Hold your device steady for faster and more accurate results.';

  @override
  String get scanningQr => 'Scanning QR code...';

  @override
  String get scanButton => 'Open camera to scan';

  @override
  String get resultTitle => 'Scan Result';

  @override
  String get resultText1 =>
      'ProReader saves your last 10 days of scan history.';

  @override
  String get resultText2 => 'To unlock unlimited scan history, please';

  @override
  String get resultText3 => 'upgrade to our Pro plan.';

  @override
  String get resultButton => 'Send';

  @override
  String get cameraPermission =>
      'Camera access has been permanently denied. Please enable it from settings.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get unexpectedError => 'An unexpected error occurred.';

  @override
  String get urlError => 'The URL could not be opened.';

  @override
  String get saveError => 'An error occurred while saving the result.';

  @override
  String get scanResult => 'Scan Result';

  @override
  String get done => 'Done';

  @override
  String get scanFrame => 'Place the QR code inside the frame to scan.';
}
