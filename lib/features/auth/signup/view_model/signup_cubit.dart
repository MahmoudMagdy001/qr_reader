import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signupRepository}) : super(SignupInitial());
  final SignupRepository signupRepository;

  Future<void> signup({
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(SignupLoading());
    try {
      await signupRepository.signup(
        email: email,
        password: password,
        phone: phone,
      );
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
