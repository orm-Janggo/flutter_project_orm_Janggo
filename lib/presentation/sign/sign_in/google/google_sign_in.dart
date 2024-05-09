import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../data/user_information/user_information.dart';



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

      // Firebase 사용자 정보
      final firebaseUser = FirebaseAuth.instance.currentUser;

      // 싱글턴을 통해 사용자 정보 업데이트
      UserInformation().updateUser(
        uid: firebaseUser?.uid,
        email: account.email,
        displayName: account.displayName,
        photoUrl: account.photoUrl,
      );

      UserInformation().updateLoginMethod(LoginMethod.google);
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
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Center(
        child: SizedBox(
          width: 220,
          height: 50,
          child: Image.asset(
            'assets/images/google.png', // 구글 로그인 버튼 이미지
          ),
        ),
      ),
    ),
  );
}