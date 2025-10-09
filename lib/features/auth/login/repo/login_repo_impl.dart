import 'package:firebase_auth/firebase_auth.dart';
import '../../../../l10n/app_localizations.dart';
import '../service/login_service.dart';
import 'login_repo.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.loginService, required this.localization});
  final LoginService loginService;
  final AppLocalizations localization;

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      return await loginService.login(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleFirebaseAuthError(e));
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  String _handleFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return localization.userNotFound;
      case 'wrong-password':
        return localization.wrongPassword;
      case 'invalid-email':
        return localization.invalidEmail;
      case 'user-disabled':
        return localization.userDisabled;
      default:
        return localization.loginError;
    }
  }
}
