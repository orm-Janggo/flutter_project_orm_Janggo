import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_orm_janggo/presentation/kakao_login/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as Kakao;

class LoginViewModel {
  late final SocialLogin _socialLogin;
  bool isUnLogin = false;
  User? user;




  Future login() async {
    isUnLogin = await _socialLogin.login();
    if (isUnLogin) {
      // 접속한 로그인 정보 가져오기
      //firebase_auth User와 이름 동일해서 오류남 타입 캐스팅으로 진행
      user = await Kakao.UserApi.instance.me() as User;
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isUnLogin = false;
    user = null;
  }

  LoginViewModel({
    required this.isUnLogin,
    this.user,
    required SocialLogin socialLogin,
  }) : _socialLogin = socialLogin;
}
