import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';

abstract interface class FirebaseAuthRepository {
  Future<UserInfoModel> callSignInWithEmailAndPassword(
      String inputEmail, String inputPassword);

  Future<UserInfoModel> callCreateUserWithEmailAndPassword(
      String inputEmail, String inputPassword);

  Stream<UserInfoModel?> callAuthStateChanges();
}
