import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import '../../../../../../data/user_information/user_information.dart';
import '../social_login.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class KakaoLoginService implements SocialLogin {
  bool isLogined = false;
  User? user;

  @override
  Future<bool> login() async {
    try {
      // 카카오톡 로그인 시도
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        isLogined = true;
        user = await UserApi.instance.me();
        return true; // 로그인 성공 시 true 반환
      } else {
        print('카카오톡이 설치되어 있지 않습니다.');
      }
    } catch (e) {
      print('카카오톡 로그인 실패: $e');
    }

    // 카카오톡 로그인 실패 시 카카오 계정으로 로그인 시도
    try {
      bool isKakaoAccountLoginSuccess = await loginWithKakaoAccount();
      if (isKakaoAccountLoginSuccess) {
        return true; // 카카오 계정 로그인 성공 시 true 반환
      }
    } catch (error) {
      // 카카오 계정 로그인 실패
      print('카카오 계정 로그인 실패: $error');
    }

    return false; // 모든 로그인 시도 실패 시 false 반환
  }

  Future<bool> loginWithKakaoAccount() async {
    try {
      // 카카오 계정으로 로그인 시도
      var provider = auth.OAuthProvider("oidc.janggo");
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      var credential = provider.credential(
        idToken: token.idToken,
        accessToken: token.accessToken,
      );
      await auth.FirebaseAuth.instance.signInWithCredential(credential);
      print('카카오계정으로 로그인 성공');
      user = await UserApi.instance.me(); // 로그인에 성공한 사용자 객체
      // 사용자 정보 업데이트
      UserInformation().updateUser(
        displayName: user!.kakaoAccount!.profile!.nickname,
        email: user!.kakaoAccount!.email,
        photoUrl: user!.kakaoAccount!.profile!.profileImageUrl,
        uid: user!.id.toString(),
      );
      print('사용자 정보${user!.id}');
      return true; // 로그인 성공 시 true 반환
    } catch (error) {
      print('카카오계정으로 로그인 실패: $error');
      return false; // 로그인 실패 시 false 반환
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      isLogined = false;
      user = null;
      return true; // 로그아웃 성공 시 true 반환
    } catch (e) {
      print('로그아웃 실패: $e');
      return false; // 로그아웃 실패 시 false 반환
    }
  }
}
