import 'package:flutter_project_orm_janggo/domain/model/social_login/kakao_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginViewModel{
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

   KakaoLoginViewModel({
    required KakaoLogin kakaoLogin,
  }) : _kakaoLogin = kakaoLogin;
}