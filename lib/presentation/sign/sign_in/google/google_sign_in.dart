import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
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

      Navigator.of(context).pushNamed('/main'); // 로그인 성공 시 메인 화면으로 이동
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Google 로그인에 실패했습니다: $error"),
        backgroundColor: Colors.red,
      ),
    );
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