import 'package:firebase_auth/firebase_auth.dart';

import '../../../../l10n/app_localizations.dart';
import '../service/signup_service.dart';
import 'signup_repo.dart';

class SignupRepositoryImpl implements SignupRepository {
  SignupRepositoryImpl({
    required this.signupService,
    required this.localization,
  });
  final SignupService signupService;
  final AppLocalizations localization;

  @override
  Future<void> signup({
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      await signupService.signup(
        email: email,
        password: password,
        phone: phone,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(_mapFirebaseError(e));
    }
  }

  String _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return localization.weakPassword;
      case 'email-already-in-use':
        return localization.emailAlreadyInUse;
      case 'invalid-email':
        return localization.invalidEmail;
      default:
        return localization.signupError;
    }
  }
}
