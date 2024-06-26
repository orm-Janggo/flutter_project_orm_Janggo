import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_project_orm_janggo/data/mapper/user_info_mapper/user_info_mapper.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/auth_repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final firebase_auth.FirebaseAuth _authentication;

  AuthRepositoryImpl(this._authentication);

  @override
  Future<UserInfoModel> signInWithEmailAndPassword(
      String inputEmail, String inputPassword) async {
    final userInfo = await _authentication.signInWithEmailAndPassword(
      email: inputEmail,
      password: inputPassword,
    );

    return userInfo.userCredentialToUserInfo();
  }

  @override
  Future<UserInfoModel> createUserWithEmailAndPassword(
      String inputEmail, String inputPassword, String inputDisplayName) async {
    final userInfo = await _authentication.createUserWithEmailAndPassword(
      email: inputEmail,
      password: inputPassword,
    );

    firebase_auth.User? user = userInfo.user;

    await user?.updateDisplayName(inputDisplayName);

    return userInfo.userCredentialToUserInfo();
  }

  @override
  UserInfoModel? getCurrentUser() {
    return _authentication.currentUser?.toUserInfo();
  }

  @override
  Future<void> sendPasswordResetEmail(String inputEmail) async {
    await _authentication.sendPasswordResetEmail(email: inputEmail);
  }

  @override
  Future<void> updateDisplayName(String inputDisplayName) async {
    firebase_auth.User? currentUser = _authentication.currentUser;

    await currentUser?.updateDisplayName(inputDisplayName);
  }

  @override
  Future<void> updatePassword(String inputPassword) async {
    firebase_auth.User? currentUser = _authentication.currentUser;

    await currentUser?.updatePassword(inputPassword);
  }

  @override
  Future<void> signOut() async {
    await _authentication.signOut();
  }
}
