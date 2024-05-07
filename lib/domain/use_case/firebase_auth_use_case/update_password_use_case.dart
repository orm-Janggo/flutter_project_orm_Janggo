import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class UpdatePasswordUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  UpdatePasswordUseCase(this._firebaseAuthRepository);

  Future<void> execute(String inputPassword) async {
    await _firebaseAuthRepository.callUpdatePassword(inputPassword);
  }
}
