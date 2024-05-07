import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/splash/splash_screen_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:provider/provider.dart';

import '../kakao_login/kakao_login_ver2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  List<Widget> splashScreens = [
    SplashScreen1(),
    SplashScreen2(),
    SplashScreen3(),
    SplashScreen4(),
    SplashScreen5(),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        if (_currentIndex < splashScreens.length - 1) {
          _currentIndex++;
        } else {
          timer.cancel(); // 모든 화면을 보여준 후 타이머 종료
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 2000),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: (_currentIndex < splashScreens.length)
            ? splashScreens[_currentIndex]
            : Container(), // 인덱스에 해당하는 스플래시 스크린을 보여줌
      ),
    );
  }
}

class SplashScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Splash Screen - 1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Splash Screen - 2.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SplashScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Splash Screen - 3.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SplashScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Splash Screen - 4.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SplashScreen5 extends StatefulWidget {
  SplashScreen5({Key? key});

  @override
  State<SplashScreen5> createState() => _SplashScreen5State();
}

class _SplashScreen5State extends State<SplashScreen5> {
  kakao.User? _kakaouser;

  @override
  void initState() {
    super.initState();
    // getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    const double paddingValue = 16.0;
    final viewModelForgetUser = context.watch<SplashScreenViewModel>();
    viewModelForgetUser.getCurrentUserInfo();

    // debugPrint(_emailUser.toString());

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Splash Screen - 5.png'),
                fit: BoxFit.cover,
              ),
            ),
            // 첫 번째 Container 안에 배치되는 위젯들
          ),
          Positioned(
            bottom: screenSize.height * 0.19, // 원하는 위치로 조정
            left: paddingValue, // 원하는 위치로 조정
            child: Container(
              width: screenSize.width - (paddingValue * 2),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.orange,
              ),
              child: TextButton(
                onPressed: () {
                  // Create Account 버튼 눌렀을 때 처리
                  context.push('/sign-up');
                },
                child: const Text(
                  "회원가입",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'school_font',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.09, // 원하는 위치로 조정
            left: paddingValue, // 원하는 위치로 조정
            child: Container(
              width: screenSize.width - (paddingValue * 2),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white70,
              ),
              child: viewModelForgetUser.firebaseUser == null
                  ? TextButton(
                      onPressed: () {
                        // Sign In 버튼 눌렀을 때 처리
                        context.push('/sign-in');
                      },
                      child: const Text(
                        "로그인",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'school_font',
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: () async {
                        if (viewModelForgetUser.firebaseUser != null) {
                          // await _authentication.signOut();
                          viewModelForgetUser.signOutCurrentUser();
                        }

                        if (_kakaouser != null) {
                          await Kakaologout(context);
                        }

                        if (!context.mounted) return;

                        context.push('/');
                      },
                      child: const Text(
                        "로그아웃",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'school_font',
                        ),
                      ),
                    ),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.16,
            left: screenSize.width * 0.06,
            child: Row(
              children: [
                Container(
                  width: screenSize.width * 0.4,
                  height: 2,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                const Text(
                  'or',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'school_font',
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: screenSize.width * 0.4,
                  height: 2,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.03,
            right: screenSize.width * 0.40,
            child: TextButton(
              onPressed: () {
                // SKIP 버튼 눌렀을 때 처리
                context.push('/main');
              },
              child: const Text(
                "둘러보기",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'school_font',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}