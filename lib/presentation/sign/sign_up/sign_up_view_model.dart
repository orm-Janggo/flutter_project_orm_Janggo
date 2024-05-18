import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/sign_up_with_email_password_use_case.dart';

class SignUpViewModel with ChangeNotifier {
  final SignUpWithEmailPasswordUseCase _signUpWithEmailPasswordUseCase;

  SignUpViewModel({
    required SignUpWithEmailPasswordUseCase signUpWithEmailPasswordUseCase,
  }) : _signUpWithEmailPasswordUseCase = signUpWithEmailPasswordUseCase;

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
