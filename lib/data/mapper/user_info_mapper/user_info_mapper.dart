import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';

extension ToUserInfo on User {
  UserInfoModel toUserInfo() {
    return UserInfoModel(
      displayName: displayName ?? '',
      email: email ?? '',
      uid: uid,
    );
  }
}

extension UserCredentailToUserInfo on UserCredential {
  UserInfoModel userCredentialToUserInfo() {
    return UserInfoModel(
      email: user?.providerData[0].email ?? '',
      displayName: user?.providerData[0].displayName ?? '',
      uid: user?.providerData[0].uid ?? '',
    );
  }
}
