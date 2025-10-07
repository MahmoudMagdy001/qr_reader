// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'مولّد QR';

  @override
  String get languageText => 'اللغة';

  @override
  String get themeText => 'المظهر';

  @override
  String get loginText => 'تسجيل الدخول';

  @override
  String get enterYourEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get enterYourPassword => 'أدخل كلمة المرور';

  @override
  String get enterYourPhone => 'أدخل رقم هاتفك';

  @override
  String get forgetPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get loginCreateAccount => 'لا يوجد لديك حساب؟';

  @override
  String get loginCreateButton => 'أنشئ حسابًا جديدًا';

  @override
  String get alreadyHaveAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get loginError => 'فشل تسجيل الدخول. حاول مرة أخرى.';

  @override
  String get signupText => 'إنشاء حساب';

  @override
  String get successCreateAccount => 'تم إنشاء الحساب بنجاح!';

  @override
  String get weakPassword => 'كلمة المرور ضعيفة جدًا.';

  @override
  String get emailAlreadyInUse => 'يوجد حساب بالفعل بهذا البريد الإلكتروني.';

  @override
  String get invalidEmail => 'عنوان البريد الإلكتروني غير صالح.';

  @override
  String get signupError => 'فشل إنشاء الحساب. حاول مرة أخرى.';

  @override
  String get userDisabled => 'تم تعطيل هذا الحساب.';

  @override
  String get userNotFound => 'لا يوجد مستخدم بهذا البريد الإلكتروني.';

  @override
  String get wrongPassword => 'كلمة المرور غير صحيحة.';

  @override
  String get requiredEmail => 'البريد الإلكتروني مطلوب.';

  @override
  String get enterValidEmail => 'أدخل بريدًا إلكترونيًا صالحًا.';

  @override
  String get requiredPassword => 'كلمة المرور مطلوبة.';

  @override
  String get enterValidPassword =>
      'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل.';

  @override
  String get requiredPhone => 'رقم الهاتف مطلوب.';

  @override
  String get enterValidPhone => 'أدخل رقم هاتف صالح.';

  @override
  String get scanTitle => 'مسح رمز QR';

  @override
  String get scanText1 => 'ضع رمز QR داخل الإطار لبدء المسح.';

  @override
  String get scanText2 => 'حافظ على ثبات الكاميرا للحصول على نتائج أسرع.';

  @override
  String get scanningQr => 'جارٍ مسح الرمز...';

  @override
  String get scanButton => 'افتح الكاميرا للمسح.';

  @override
  String get resultTitle => 'نتيجة المسح';

  @override
  String get resultText1 => 'يحتفظ تطبيق Proreader بسجل آخر 10 أيام فقط.';

  @override
  String get resultText2 => 'للاحتفاظ بكل سجل عمليات المسح الخاصة بك، من فضلك';

  @override
  String get resultText3 => 'قم بشراء باقة Pro.';

  @override
  String get resultButton => 'إرسال';
}
