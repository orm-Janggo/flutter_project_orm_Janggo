import 'package:flutter_project_orm_janggo/domain/repository/auth_repository/auth_repository.dart';

class UpdatePasswordUseCase {
  final AuthRepository _authRepository;

  UpdatePasswordUseCase(this._authRepository);

  Future<void> execute(String inputPassword) async {
    await _authRepository.updatePassword(inputPassword);
  }
}
