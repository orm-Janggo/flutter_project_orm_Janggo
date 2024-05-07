import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email', 'profile'],  // 최소 범위만 요청
);

Future<void> GoogleLogin(BuildContext context) async {
  GoogleSignInAccount? _currentUser;
  try {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    if (account != null) {
      _currentUser = account;

      // 파이어베이스 인증
      final GoogleSignInAuthentication googleAuth = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      context.go('/main');
    }
  } catch (error) {
    print("Google 로그인에 실패했습니다: $error");
  }
}

Widget googleLoginButton(BuildContext context) {
  return InkWell(
    onTap: () {
      GoogleLogin(context); // 버튼을 클릭하면 구글 로그인을 실행
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: SizedBox(
          width: 220,
          height: 50,
          child: Image.asset(
            'assets/images/google_sign_in.png', // 구글 로그인 버튼 이미지
          ),
        ),
      ),
    ),
  );
}