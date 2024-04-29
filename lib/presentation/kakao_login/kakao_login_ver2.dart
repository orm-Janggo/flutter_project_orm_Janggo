import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' ;
Future<bool> signInWithKakao() async {
  try {
    // 카카오 로그인 시도
    OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
    print('카카오톡으로 로그인 성공 ${token.accessToken}');
    User user = await UserApi.instance.me();
    print('사용자 정보${user.id}');
    return true; // 로그인 성공 시 true 반환
  } catch (error) {
    // 카카오톡 로그인 실패 시, 카카오 계정으로 로그인 시도
    print('카카오톡으로 로그인 실패: $error');
    try {
      // Firebase 연동 기능 구현
      var provider = Auth.OAuthProvider("oidc.janggo");
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
     var credential = provider.credential(
       idToken: token.idToken,
       accessToken: token.accessToken,
     );
     Auth.FirebaseAuth.instance.signInWithCredential(credential);
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

void navigateToMain(BuildContext context) async {
  bool success = await signInWithKakao();
  if (success) {
    context.push('/main');
  }
}

void logout() async {
  try {
    await UserApi.instance.logout();
    print('로그아웃 성공, SDK에서 토큰 삭제');
  } catch (error) {
    print('로그아웃 실패, SDK에서 토큰 삭제 $error');
  }
}

void userInfo() async {
  try {
    User user = await UserApi.instance.me();
    print('사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
        '\n이메일: ${user.kakaoAccount?.email}');
  } catch (error) {
    print('사용자 정보 요청 실패 $error');
  }
}
Widget getKakaoLoginButton(BuildContext context) {
  return InkWell(
    onTap: () {
      navigateToMain(context);
    },
    child: Container(
      color: Colors.yellow,
      child: SizedBox(
        width: 210,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/kakao_login_button.png',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    ),
  );
}
