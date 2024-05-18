import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/auth_repository/auth_repository.dart';

class SignUpWithEmailPasswordUseCase {
  final AuthRepository _authRepository;

  SignUpWithEmailPasswordUseCase(this._authRepository);

  Future<UserInfoModel> execute(
    String inputEmail,
    String inputPassword,
    String inputDisplayName,
  ) async {
    return await _authRepository.callCreateUserWithEmailAndPassword(
      inputEmail,
      inputPassword,
      inputDisplayName,
    );
  }
}
