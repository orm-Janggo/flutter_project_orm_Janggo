enum LoginMethod {
  google,
  kakao,
  email,
  none,
}

class UserInfo {
  final String? uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  UserInfo({this.uid, this.email, this.displayName, this.photoUrl});
}

class UserInformation {
  static final UserInformation _instance = UserInformation._internal();

  LoginMethod loginMethod = LoginMethod.none;
  UserInfo? userInfo;

  UserInformation._internal();

  factory UserInformation() {
    return _instance;
  }

  void updateLoginMethod(LoginMethod method) {
    loginMethod = method;  // 로그인 방식을 설정
  }

  // UserInfo 객체 업데이트
  void updateUser({String? uid, String? email, String? displayName, String? photoUrl}) {
    // 기존 UserInfo 객체가 있는지 확인
    if (userInfo == null) {
      userInfo = UserInfo(
        uid: uid,
        email: email,
        displayName: displayName,
        photoUrl: photoUrl,
      );
    } else {
      // 기존 객체가 있으면 업데이트
      userInfo = UserInfo(
        uid: uid ?? userInfo?.uid,
        email: email ?? userInfo?.email,
        displayName: displayName ?? userInfo?.displayName,
        photoUrl: photoUrl ?? userInfo?.photoUrl,
      );
    }
  }
}