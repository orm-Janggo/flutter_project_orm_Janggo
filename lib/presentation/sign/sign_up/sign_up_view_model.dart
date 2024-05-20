import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/sign_up_with_email_password_use_case.dart';

class SignUpViewModel with ChangeNotifier {
  final SignUpWithEmailPasswordUseCase _signUpWithEmailPasswordUseCase;

  SignUpViewModel({
    required SignUpWithEmailPasswordUseCase signUpWithEmailPasswordUseCase,
  }) : _signUpWithEmailPasswordUseCase = signUpWithEmailPasswordUseCase;

  String? _inputEmail;
  String? _inputDisplayName;
  String? _inputPassword;
  String? _inputCheckPassword;

  bool _isObscure = true;
  bool _isCheckObscure = true;

  String? get inputEmail => _inputEmail;

  String? get inputDisplayName => _inputDisplayName;

  String? get inputPassword => _inputPassword;

  String? get inputCheckPassword => _inputCheckPassword;

  bool get isObscure => _isObscure;

  bool get isCheckObscure => _isCheckObscure;

  void changeInputEmail(String value) {
    _inputEmail = value;

    notifyListeners();
  }

  void changeInputDisplayName(String value) {
    _inputDisplayName = value;

    notifyListeners();
  }

  void changeInputPassword(String value) {
    _inputPassword = value;

    notifyListeners();
  }

  void changeInputCheckPassword(String value) {
    _inputCheckPassword = value;

    notifyListeners();
  }

  void changeIsObscure() {
    _isObscure = !_isObscure;

    notifyListeners();
  }

  void changeIsCheckObscure() {
    _isCheckObscure = !_isCheckObscure;

    notifyListeners();
  }

  Future<void> signUpWithFirebaseAuth(
    String inputEmail,
    String inputPassword,
    String inputDisplayName,
  ) async {
    await _signUpWithEmailPasswordUseCase.execute(
      inputEmail,
      inputPassword,
      inputDisplayName,
    );

    notifyListeners();
  }
}
