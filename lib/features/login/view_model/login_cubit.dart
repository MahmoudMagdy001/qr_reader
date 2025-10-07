import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(const LoginState());
  final LoginRepository loginRepository;

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true));

    try {
      final userData = await loginRepository.login(
        email: email,
        password: password,
      );

      emit(state.copyWith(isLoading: false, userData: userData));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void logout() {
    emit(const LoginState());
  }
}
