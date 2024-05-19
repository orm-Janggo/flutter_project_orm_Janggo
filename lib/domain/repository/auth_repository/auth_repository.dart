import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';

abstract interface class AuthRepository {
  Future<UserInfoModel> signInWithEmailAndPassword(
    String inputEmail,
    String inputPassword,
  );

  Future<UserInfoModel> createUserWithEmailAndPassword(
    String inputEmail,
    String inputPassword,
    String inputDisplayName,
  );

  UserInfoModel? getCurrentUser();

  Future<void> sendPasswordResetEmail(String inputEmail);

  Future<void> updateDisplayName(String inputDisplayName);

  Future<void> updatePassword(String inputPassword);

  Future<void> signOut();
}
