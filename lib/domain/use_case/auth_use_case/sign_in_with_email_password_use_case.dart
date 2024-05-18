import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/auth_repository/auth_repository.dart';

class SignInWithEmailPasswordUseCase {
  final AuthRepository _authRepository;

  SignInWithEmailPasswordUseCase(this._authRepository);

  Future<UserInfoModel> execute(String inputEmail, String inputPassword) async {
    return await _authRepository.callSignInWithEmailAndPassword(
        inputEmail, inputPassword);
  }
}
