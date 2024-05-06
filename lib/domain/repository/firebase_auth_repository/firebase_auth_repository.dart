import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';

abstract interface class FirebaseAuthRepository {
  Future<UserInfoModel> callSignInWithEmailAndPassword(
      String inputEmail, String inputPassword);

  Future<UserInfoModel> callCreateUserWithEmailAndPassword(
      String inputEmail, String inputPassword);

  UserInfoModel? callCurrentUser();

  Future<void> callSendPasswordResetEmail(String inputEmail);

  Future<void> callUpdateDisplayName(String inputDisplayName);

  Future<void> callUpdatePassword(String inputPassword);
}
