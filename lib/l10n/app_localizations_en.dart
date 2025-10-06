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
  String get textOfButton => 'You have pushed the button this many times:';

  @override
  String get loginText => 'Login';

  @override
  String get enterYourPhone => 'Enter Your Phone';

  @override
  String get enterYourPassword => 'Password';

  @override
  String get forgetPassword => 'Forget Password?';

  @override
  String get scanTitle => 'Scan QR code';

  @override
  String get scanText1 => 'Place QR code inside the frame to scan please';

  @override
  String get scanText2 => 'Avoid shake to get results quickly';

  @override
  String get scanningQr => 'Scanning Code...';

  @override
  String get scanButton => 'Place Camera Code';

  @override
  String get resultText1 => 'Proreader will keep your last 10 days history';

  @override
  String get resultText2 => 'To keep all your scanned history please';

  @override
  String get resultText3 => 'purchase our pro package';

  @override
  String get resultButton => 'Send';

  @override
  String get languageText => 'Language';

  @override
  String get themeText => 'Theme';
}
