import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class SignInWithEmailPasswordUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  SignInWithEmailPasswordUseCase(this._firebaseAuthRepository);

  Future<UserInfoModel> execute(String inputEmail, String inputPassword) async {
    return await _firebaseAuthRepository.callSignInWithEmailAndPassword(
        inputEmail, inputPassword);
  }
}
