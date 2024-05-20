import 'package:flutter_project_orm_janggo/domain/repository/auth_repository/auth_repository.dart';

class UpdateDisplayNameUseCase {
  final AuthRepository _authRepository;

  UpdateDisplayNameUseCase(this._authRepository);

  Future<void> execute(String inputDisplayName) async {
    await _authRepository.updateDisplayName(inputDisplayName);
  }
}
