import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'kakao_login/kakao_login_ver2.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장고처리'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Center(
                child: SizedBox(
                  width: 370,
                  height: 400,
                  child: Lottie.asset('assets/images/janggo_main.json'),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            getKakaoLoginButton(context),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 50,
              width: 210,
              decoration: BoxDecoration(
                color: Colors.cyan
              ),
              child: TextButton(onPressed: () {
                context.push('/sign-in');
              }, child: Text('Login',style: TextStyle(fontSize: 20),)
                ,),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 50,
              width: 210,
              decoration: BoxDecoration(
                  color: Colors.cyan
              ),
              child: TextButton(onPressed: () {
                context.push('/main');
              }, child: Text('비회원사용하기',style: TextStyle(fontSize: 20),)
                ,),
            )
          ],
        ),
      ),
    );
  }
}
