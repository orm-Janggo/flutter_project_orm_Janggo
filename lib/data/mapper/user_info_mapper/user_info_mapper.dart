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
