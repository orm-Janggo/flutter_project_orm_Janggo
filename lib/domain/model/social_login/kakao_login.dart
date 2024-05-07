import 'package:flutter_project_orm_janggo/domain/model/social_login/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        // 카카오 로그인 시도
        var provider = Auth.OAuthProvider("oidc.janggo");
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        var credential = provider.credential(
          idToken: token.idToken,
          accessToken: token.accessToken,
        );
        await Auth.FirebaseAuth.instance.signInWithCredential(credential);
        print('카카오톡으로 로그인 성공 ${token.accessToken}');
        User user = await UserApi.instance.me();
        print('사용자 정보${user.id}');
        return true; // 로그인 성공 시 true 반환
      } else {
        // 카카오톡이 설치되어 있지 않은 경우
        print('카카오톡이 설치되어 있지 않습니다.');
        return false; // 로그인 실패 시 false 반환
      }
    } catch (error) {
      // 카카오톡 로그인 실패 시, 카카오 계정으로 로그인 시도
      print('카카오톡으로 로그인 실패: $error');
      try {
        // Firebase 연동 기능 구현 완료
        var provider = Auth.OAuthProvider("oidc.janggo");
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        var credential = provider.credential(
          idToken: token.idToken,
          accessToken: token.accessToken,
        );
        await Auth.FirebaseAuth.instance.signInWithCredential(credential);
        print('카카오계정으로 로그인 성공');
        User user = await UserApi.instance.me();
        print('사용자 정보${user.id}');
        return true; // 로그인 성공 시 true 반환
      } catch (error) {
        print('카카오계정으로 로그인 실패: $error');
        return false; // 로그인 실패 시 false 반환
      }
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (e) {
      return false;
    }
  }
}
