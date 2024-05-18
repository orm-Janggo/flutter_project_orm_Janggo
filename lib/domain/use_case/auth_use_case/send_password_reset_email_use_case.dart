import 'package:flutter_project_orm_janggo/domain/repository/auth_repository/auth_repository.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepository _authRepository;

  SendPasswordResetEmailUseCase(this._authRepository);

  Future<void> execute(String inputEmail) async {
    await _authRepository.callSendPasswordResetEmail(inputEmail);
  }
}
