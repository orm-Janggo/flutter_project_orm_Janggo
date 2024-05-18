import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/send_password_reset_email_use_case.dart';

class ForgotPasswordViewModel with ChangeNotifier {
  final SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;

  ForgotPasswordViewModel(
      {required SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase})
      : _sendPasswordResetEmailUseCase = sendPasswordResetEmailUseCase;

  void sendPasswordResetWithFirebaseAuth(String inputEmail) async {
    await _sendPasswordResetEmailUseCase.execute(inputEmail);
    notifyListeners();
  }
}
