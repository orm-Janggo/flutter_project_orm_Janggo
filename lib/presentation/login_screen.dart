import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'kakao_login/kakao_login.dart';
import 'kakao_login/loginViewModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginViewModel = LoginViewModel(isUnLogin: false, socialLogin: KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장고처리'),
      ),
      body: Column(
        children: [
          Lottie.asset('assets/janggo_main2.json'),

        ],
      ),
    );
  }
}
