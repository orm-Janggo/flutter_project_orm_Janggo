import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/auth_repository/auth_repository.dart';

class AuthStateChangesUseCase {
  final AuthRepository _authRepository;

  AuthStateChangesUseCase(this._authRepository);

  UserInfoModel? execute() {
    return _authRepository.getCurrentUser();
  }
}
