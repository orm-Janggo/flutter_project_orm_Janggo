import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_in/kakao/social_login/kakao_login/kakao_login_service.dart';
import 'package:flutter_project_orm_janggo/presentation/splash/splash_screen_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  List<Widget> splashScreens = [
    const SplashScreenImage(imagePath: 'assets/images/Splash Screen - 1.png'),
    const SplashScreenImage(imagePath: 'assets/images/Splash Screen - 2.png'),
    const SplashScreenImage(imagePath: 'assets/images/Splash Screen - 3.png'),
    const SplashScreenImage(imagePath: 'assets/images/Splash Screen - 4.png'),
    const SplashScreen5(),
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

class SplashScreenImage extends StatelessWidget {
  final String imagePath;

  const SplashScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SplashScreen5 extends StatelessWidget {
  const SplashScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    const double paddingValue = 16.0;
    final viewModelForFetchUser = context.watch<SplashScreenViewModel>();
    viewModelForFetchUser.fetchCurrentUserInfo();

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
            bottom: screenSize.height * 0.19,
            left: paddingValue,
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
                    color: Colors.black,
                    fontFamily: 'school_font',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.09,
            left: paddingValue,
            child: Container(
              width: screenSize.width - (paddingValue * 2),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white70,
              ),
              child: viewModelForFetchUser.firebaseUser == null
                  ? TextButton(
                      onPressed: () {
                        // Sign In 버튼 눌렀을 때 처리
                        context.push('/sign-in');
                      },
                      child: const Text(
                        "로그인",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'school_font',
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: () async {
                        if (viewModelForFetchUser.firebaseUser != null) {
                          // 로그아웃 처리
                          viewModelForFetchUser.signOutCurrentUser();
                        }

                        // 카카오 로그아웃
                        KakaoLoginService kakaoLoginService =
                            KakaoLoginService();
                        if (viewModelForFetchUser.kakaoUser != null) {
                          await kakaoLoginService.logout();
                        }

                        if (!context.mounted) return;
                        // 홈으로 이동
                        context.push('/');
                      },
                      child: const Text(
                        "로그아웃",
                        style: TextStyle(
                          fontSize: 16,
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
                  style: TextStyle(fontFamily: 'school_font', fontSize: 14),
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
                context.push('/main');
              },
              child: const Text(
                "둘러보기",
                style: TextStyle(
                  fontSize: 15,
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
