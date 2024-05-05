import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class AuthStateChangesUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  AuthStateChangesUseCase(this._firebaseAuthRepository);

  Stream<UserInfoModel?> execute() {
    // AuthRepository를 통해 사용자의 인증 상태 변경 스트림을 가져옵니다.
    return _firebaseAuthRepository.callAuthStateChanges();
  }
}
