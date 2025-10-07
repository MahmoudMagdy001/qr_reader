abstract class SignupRepository {
  Future<void> signup({
    required String email,
    required String password,
    required String phone,
  });
}
