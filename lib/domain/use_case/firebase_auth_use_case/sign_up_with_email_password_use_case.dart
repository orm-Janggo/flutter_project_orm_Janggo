import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class SignUpWithEmailPasswordUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  SignUpWithEmailPasswordUseCase(this._firebaseAuthRepository);

  Future<UserInfoModel> execute(
    String inputEmail,
    String inputPassword,
    String inputDisplayName,
  ) async {
    return await _firebaseAuthRepository.callCreateUserWithEmailAndPassword(
      inputEmail,
      inputPassword,
      inputDisplayName,
    );
  }
}
