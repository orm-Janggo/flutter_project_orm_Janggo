import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class UpdateDisplayNameUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  UpdateDisplayNameUseCase(this._firebaseAuthRepository);

  Future<void> execute(String inputDisplayName) async {
    await _firebaseAuthRepository.callUpdateDisplayName(inputDisplayName);
  }
}
