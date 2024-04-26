import 'package:firebase_auth/firebase_auth.dart';

class SignupViewModel {
  final SignupViewModel _model = SignupViewModel();

  Future<User> signup(String email, String password) async {
    return await _model.signup(email, password);
  }
}
