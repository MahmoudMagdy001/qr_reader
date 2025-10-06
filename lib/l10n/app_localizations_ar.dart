// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'مولد رمز الاستجابة السريعة';

  @override
  String get textOfButton => 'لقد ضغطت على الزر عدة مرات:';

  @override
  String get loginText => 'تسجيل الدخول';

  @override
  String get enterYourPhone => 'ادخل رقم الهاتف';

  @override
  String get enterYourPassword => 'الرقم السري';

  @override
  String get forgetPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get scanTitle => 'مسح رمز الاستجابة السريعة';

  @override
  String get scanText1 => 'ضع رمز الاستجابة داخل الإطار للمسح، من فضلك';

  @override
  String get scanText2 => 'تجنب الاهتزاز للحصول على النتائج بسرعة';

  @override
  String get scanningQr => 'جاري مسح الرمز...';

  @override
  String get scanButton => 'فتح الكاميرا للمسح';

  @override
  String get resultText1 => 'سيحتفظ برو ريدر بسجل آخر 10 أيام فقط';

  @override
  String get resultText2 => 'للاحتفاظ بجميع سجلات المسح الخاصة بك، من فضلك';

  @override
  String get resultText3 => 'قم بشراء باقة برو';

  @override
  String get resultButton => 'ارسال';

  @override
  String get languageText => 'اللغه';

  @override
  String get themeText => 'المظهر';
}
