import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({this.isLoading = false, this.userData, this.errorMessage});
  final bool isLoading;
  final Map<String, dynamic>? userData;
  final String? errorMessage;

  LoginState copyWith({
    bool? isLoading,
    Map<String, dynamic>? userData,
    String? errorMessage,
  }) => LoginState(
    isLoading: isLoading ?? this.isLoading,
    userData: userData ?? this.userData,
    errorMessage: errorMessage,
  );

  @override
  List<Object?> get props => [isLoading, userData, errorMessage];
}
