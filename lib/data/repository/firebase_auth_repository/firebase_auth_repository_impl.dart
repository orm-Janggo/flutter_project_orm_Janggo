import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_project_orm_janggo/data/mapper/user_info_mapper/user_info_mapper.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final firebase_auth.FirebaseAuth _authentication;

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
  UserInfoModel? callCurrentUser() {
    return _authentication.currentUser?.toUserInfo();
  }

  @override
  Future<void> callSendPasswordResetEmail(String inputEmail) async {
    await _authentication.sendPasswordResetEmail(email: inputEmail);
  }

  @override
  Future<void> callUpdateDisplayName(String inputDisplayName) async {
    firebase_auth.User? currentUser = _authentication.currentUser;

    await currentUser?.updateDisplayName(inputDisplayName);
  }

  @override
  Future<void> callUpdatePassword(String inputPassword) async {
    firebase_auth.User? currentUser = _authentication.currentUser;

    await currentUser?.updatePassword(inputPassword);
  }

  @override
  Future<void> callSignOut() async {
    await _authentication.signOut();
  }
}
