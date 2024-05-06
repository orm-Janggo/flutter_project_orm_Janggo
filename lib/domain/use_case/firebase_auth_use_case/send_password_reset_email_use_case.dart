import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class SendPasswordResetEmailUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  SendPasswordResetEmailUseCase(this._firebaseAuthRepository);

  Future<void> execute(String inputEmail) async {
    await _firebaseAuthRepository.callSendPasswordResetEmail(inputEmail);
  }
}
