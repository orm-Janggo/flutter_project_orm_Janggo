import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/sign_in_with_email_password_use_case.dart';

import '../../../data/user_information/user_information.dart';

class SignInViewModel with ChangeNotifier {
  final SignInWithEmailPasswordUseCase _signInWithEmailPasswordUseCase;

  SignInViewModel(
      {required SignInWithEmailPasswordUseCase signInWithEmailPasswordUseCase})
      : _signInWithEmailPasswordUseCase = signInWithEmailPasswordUseCase;

  Future<void> signInWithFirebaseAuth(String inputEmail, String inputPassword) async {
    await _signInWithEmailPasswordUseCase.execute(inputEmail, inputPassword);
    UserInformation().updateLoginMethod(LoginMethod.email);
    UserInformation().updateUser(email: inputEmail);
    notifyListeners();
  }
}
