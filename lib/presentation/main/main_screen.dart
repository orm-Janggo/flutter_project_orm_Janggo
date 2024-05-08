import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/kakao_login/kakao_login_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/main/main_screen_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../data/user_information/user_information.dart';
import '../../domain/model/social_login/kakao_login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final kakaoLoginViewModel = KakaoLoginViewModel(kakaoLogin: KakaoLogin());

  // // initialize google mobile ad sdk
  // Future<InitializationStatus> _initGoogleMobileAds() {
  //   return MobileAds.instance.initialize();
  // }
  //
  // // Add _interstitialAd
  // InterstitialAd? _interstitialAd;
  //
  // // Implement _loadInterstitialAd()
  // void _loadInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: AdHelper.interstitialAdUnitId,
  //     request: AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (ad) {
  //         ad.fullScreenContentCallback = FullScreenContentCallback(
  //           onAdDismissedFullScreenContent: (ad) {
  //             _onButtonPressed(context);
  //           },
  //         );
  //
  //         setState(() {
  //           _interstitialAd = ad;
  //         });
  //       },
  //       onAdFailedToLoad: (err) {
  //         print('Failed to load an interstitial ad: ${err.message}');
  //       },
  //     ),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _initKakaoUser();
    // _initGoogleMobileAds();
    // _loadInterstitialAd();
  }

  Future<void> _initKakaoUser() async {
    await kakaoLoginViewModel.login();
    setState(() {}); // 사용자 정보가 업데이트되었으므로 화면 갱신
  }

  final List<TextEditingController> _controllers = [
    TextEditingController()
  ]; // 재료 텍스트 필드 컨트롤러

  void _addTextField() {
    // 재료 추가
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _removeTextField(int index) {
    // 재료 삭제
    if (_controllers.length > 1) {
      // 최소 1개 이상이 되도록 제한
      setState(() {
        _controllers.removeAt(index);
      });
    }
  }

  List<String> _getTextFieldValues() {
    return _controllers.map((controller) => controller.text).toList();
  }

  void _onButtonPressed(BuildContext context) {
    List<String> values = _getTextFieldValues();
    String concatenatedValues = values.join(", "); // 데이터를 문자열로 결합

    // 레시피 보기 버튼을 누를 때 '/main/recipe' 경로로 이동
    context.go('/main/recipe', extra: concatenatedValues);
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    // _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModelForgetUser = context.watch<MainScreenViewModel>();
    viewModelForgetUser.getCurrentUserInfo();

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double centerX = screenWidth / 2;
    final double centerY = screenHeight / 2;

    final userInformation = UserInformation(); // 싱글턴 인스턴스
    final loginMethod = userInformation.loginMethod; // 로그인 방식 가져오기
    final userInfo = userInformation.userInfo; // 사용자 정보 가져오기

    return Scaffold(
      // 키보드에 의한 UI 이동방지
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (viewModelForgetUser.firebaseUser != null) {
              context.push('/');
              return;
            }

            Navigator.of(context).pop();
          },
        ),
        actions: [
          if (loginMethod == LoginMethod.kakao) // 카카오 로그인
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context.push('/main/my-page'); // 사용자 정보 페이지로 이동
                    },
                    child: Text(
                      userInfo?.displayName ?? 'Unknown Kakao User',
                      style: const TextStyle(fontFamily: 'school_font'),
                    ),
                  ),
                ],
              ),
            )
          else if (loginMethod == LoginMethod.google) // 구글 로그인
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context.push('/main/my-page'); // 사용자 정보 페이지로 이동
                    },
                    child: Text(
                      userInfo?.displayName ??
                          userInfo?.email ??
                          'Unknown Google User',
                      style: const TextStyle(fontFamily: 'school_font'),
                    ),
                  ),
                ],
              ),
            )
          else if (loginMethod == LoginMethod.email) // Firebase 이메일 로그인
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context.push('/main/my-page'); // 사용자 정보 페이지로 이동
                    },
                    child: Text(
                      userInfo?.email ?? '',
                      style: const TextStyle(fontFamily: 'school_font'),
                    ),
                  ),
                ],
              ),
            )
          else // 비회원 또는 로그인되지 않은 상태
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Guest',
                    style: const TextStyle(fontFamily: 'school_font'),
                  ),
                ],
              ),
            ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/main-background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Positioned(
                left: centerX - 50,
                top: centerY - 50,
                child: const Text(
                  '재료를 넣어주세요!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'school_font',
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 155.0),
                child: SizedBox(
                  height: 340,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // 첫 번째 영역의 텍스트 폼 필드들
                        for (var i = 0; i < _controllers.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 70,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                controller: _controllers[i],
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      _removeTextField(i);
                                    },
                                  ),
                                  hintText: '재료를 입력해주세요',
                                  hintStyle: TextStyle(
                                    fontFamily: 'school_font',
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 4.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.orange,
                                      width: 4.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white70,
                                      width: 4.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'school_font',
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Align(
                alignment: Alignment.bottomCenter, // 화면 아래 가운데 정렬
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white70,
                      ),
                      child: TextButton(
                        onPressed: _addTextField,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '재료 추가',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'school_font',
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.add, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.orange,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (_controllers
                              .any((controller) => controller.text.isEmpty)) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  '알림',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'school_font',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                content: Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: const Text(
                                    '재료가 없습니다!',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'school_font',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      '확인',
                                      style: TextStyle(
                                        fontFamily: 'school_font',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            _onButtonPressed(context);
                            // _interstitialAd?.show();
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '레시피 보기',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'school_font',
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
