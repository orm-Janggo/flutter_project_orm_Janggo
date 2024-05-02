
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

Future<bool> signInWithKakao() async {
  print(await KakaoSdk.origin);
  try {
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

void navigateToMain(BuildContext context) async {
  bool success = await signInWithKakao();
  if (success) {
    context.push('/main');
  }
}

Future<void> Kakaologout(BuildContext context) async {
  bool logoutSuccessful = false;

  try {
    await UserApi.instance.logout();
    print('로그아웃 성공, SDK에서 토큰 삭제');
  } catch (error) {
    print('로그아웃 실패, SDK에서 토큰 삭제 $error');
  }

  try{
    await Auth.FirebaseAuth.instance.signOut();
    logoutSuccessful = true;
  }catch(e){
    print('Firebase 로그아웃 실패 : $e');
  }

  if(logoutSuccessful){

    navigateToMain(context);
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
  return Container(
    width: 320,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.yellow,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: InkWell(
      onTap: () {
        navigateToMain(context);
      },
      child: Image.asset('assets/images/kakao_login_large_wide.png'),
    ),
  );
}
