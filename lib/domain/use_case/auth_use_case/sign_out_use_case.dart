import 'package:flutter_project_orm_janggo/domain/repository/auth_repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  Future<void> execute() async {
    await _authRepository.signOut();
  }
}
