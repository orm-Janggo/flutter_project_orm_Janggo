import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'kakao_login.dart';

class KakaoLoginService {
  final KakaoLogin _kakaoLogin;
  bool isLogined = false;
  User? user;


  Future login() async{
    isLogined = await _kakaoLogin.login();
    if(isLogined){
      user = await UserApi.instance.me();
    }
  }

  Future logout() async{
    await _kakaoLogin.logout();
    isLogined = false;
    user = null;
  }

  KakaoLoginService({
    required KakaoLogin kakaoLogin,
  }) : _kakaoLogin = kakaoLogin;
}