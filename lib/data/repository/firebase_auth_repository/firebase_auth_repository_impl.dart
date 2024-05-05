import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_orm_janggo/data/mapper/user_info_mapper/user_info_mapper.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseAuth _authentication;

  FirebaseAuthRepositoryImpl(this._authentication);

  @override
  Future<UserInfoModel> callSignInWithEmailAndPassword(
      String inputEmail, String inputPassword) async {
    final userInfo = await _authentication.signInWithEmailAndPassword(
      email: inputEmail,
      password: inputPassword,
    );

    return userInfo.userCredentialToUserInfo();
  }

  @override
  Future<UserInfoModel> callCreateUserWithEmailAndPassword(
      String inputEmail, String inputPassword) async {
    final userInfo = await _authentication.createUserWithEmailAndPassword(
      email: inputEmail,
      password: inputPassword,
    );

    return userInfo.userCredentialToUserInfo();
  }

  @override
  Stream<UserInfoModel?> callAuthStateChanges() {
    // FirebaseAuth의 authStateChanges() 메서드를 사용하여 인증 상태를 감지하는 스트림을 생성
    final authStateStream = _authentication.authStateChanges();

    // authStateStream의 각 이벤트를 UserInfoModel로 변환하여 반환
    return authStateStream.map((user) {
      if (user != null) {
        // FirebaseAuth의 User 객체에서 필요한 정보를 추출하여 UserInfoModel로 변환
        return UserInfoModel(
          email: user.email ?? '',
          displayName: user.displayName ?? '',
          uid: user.uid,
        );
      } else {
        // 사용자가 로그아웃한 경우에는 null을 반환합니다.
        return null;
      }
    });
  }

  @override
  Future<void> callSendPasswordResetEmail(String inputEmail) async {
    await _authentication.sendPasswordResetEmail(email: inputEmail);
  }
}
