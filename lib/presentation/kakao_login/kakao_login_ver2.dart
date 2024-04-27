import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
Future<void> signInWithKakao() async {
  try {
    // 카카오 로그인 시도
    await UserApi.instance.loginWithKakaoTalk();
    print('카카오톡으로 로그인 성공');
  } catch (error) {
    // 카카오톡 로그인 실패 시, 카카오 계정으로 로그인 시도
    print('카카오톡으로 로그인 실패: $error');
    try {
      await UserApi.instance.loginWithKakaoAccount();
      print('카카오계정으로 로그인 성공');
    } catch (error) {
      print('카카오계정으로 로그인 실패: $error');
    }
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
      signInWithKakao();
      context.push('/main');
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
