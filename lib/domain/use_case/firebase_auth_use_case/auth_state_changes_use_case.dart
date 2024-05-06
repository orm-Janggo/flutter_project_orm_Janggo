import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class AuthStateChangesUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  AuthStateChangesUseCase(this._firebaseAuthRepository);

  UserInfoModel? execute() {
    return _firebaseAuthRepository.callCurrentUser();
  }
}
