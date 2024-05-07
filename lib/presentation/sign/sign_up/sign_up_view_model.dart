import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/sign_up_with_email_password_use_case.dart';

class SignUpViewModel with ChangeNotifier {
  final SignUpWithEmailPasswordUseCase _signUpWithEmailPasswordUseCase;

  SignUpViewModel(
      {required SignUpWithEmailPasswordUseCase signUpWithEmailPasswordUseCase})
      : _signUpWithEmailPasswordUseCase = signUpWithEmailPasswordUseCase;

  Future<void> signUpWithFirebaseAuth(
      String inputEmail, String inputPassword) async {
    await _signUpWithEmailPasswordUseCase.execute(inputEmail, inputPassword);

    notifyListeners();
  }
}