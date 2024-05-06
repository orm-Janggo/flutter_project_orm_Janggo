import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class SignOutUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  SignOutUseCase(this._firebaseAuthRepository);

  Future<void> execute() async {
    await _firebaseAuthRepository.callSignOut();
  }
}
