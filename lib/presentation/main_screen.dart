import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'; // go_router 임포트 추가
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class MainScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<StatefulWidget> {
  final _authentication = firebase_auth.FirebaseAuth.instance;

  firebase_auth.User? _emailUser;

  User? _user;

  @override
  void initState() {
    super.initState();
    _initKakaoUser();
    getEmailUser();
  }

  void getEmailUser() {
    _authentication.authStateChanges().listen((firebase_auth.User? emailUser) {
      if (emailUser != null) {
        _emailUser = emailUser;
        debugPrint(_emailUser.toString());
        setState(() {});
      }
    });
  }

  Future<void> _initKakaoUser() async {
    _user = await UserApi.instance.me();
    setState(() {});
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 키보드에 의한 UI 이동방지
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if(_emailUser != null) {
              context.push('/');
              return;
            }

            Navigator.of(context).pop();
          },
        ),
        actions: [
          _user != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_user!.kakaoAccount!.profile!.nickname!),
                    ],
                  ),
                )
              : _emailUser != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.push('/main/my-page');
                            },
                            child: Text(_emailUser?.displayName ?? _emailUser!.email.toString(), style: TextStyle(fontFamily: 'school_font',),),
                          )
                        ],
                      ),
                    )
                  : const Text('비회원', style: TextStyle(fontFamily: 'school_font',),),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/main-background.png'),
              fit: BoxFit.cover,
            )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                padding: EdgeInsets.only(top: 10),
                width: 200,
                height: 200,
                child: Text(
                  '재료를 넣어주세요!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'school_font',),
                )),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 155.0),
              child: SizedBox(
                height: 340, // 스크롤 가능한 영역의 높이를 설정합니다.
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 첫 번째 영역의 텍스트 폼 필드들
                      for (var i = 0; i < _controllers.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 70, // 텍스트 폼 필드의 고정된 높이 설정
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
                                hintStyle: TextStyle(fontFamily: 'school_font',),
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
                      // 다른 영역의 추가되는 텍스트 폼 필드들
                      // 이 영역은 특정 높이 이상일 때만 스크롤됩니다.
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 버튼을 화면 맨 아래에 고정시킴
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Align(
              alignment: Alignment.bottomCenter, // 화면 아래 중앙에 배치
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end, // 하단에 배치
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 16),
                    // 아래 여백 추가
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
                    width: 300,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 16),
                    // 아래 여백 추가
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.orange,
                    ),
                    child: TextButton(
                      onPressed: () {
                        // 재료가 입력되지 않은 경우
                        if (_controllers
                            .any((controller) => controller.text.isEmpty)) {
                          // 알럿 대화상자 표시
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                '알림',
                                style: TextStyle(fontSize: 16, fontFamily: 'school_font',),
                                textAlign: TextAlign.center,
                              ),
                              content: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: const Text(
                                  '재료가 없습니다!',
                                  style: TextStyle(fontSize: 18, fontFamily: 'school_font',),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('확인', style: TextStyle(fontFamily: 'school_font',),),
                                ),
                              ],
                            ),
                          );
                        } else {
                          _onButtonPressed(context);
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
    );
  }
}
