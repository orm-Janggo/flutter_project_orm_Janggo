import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  late TextEditingController _accountController;
  late TextEditingController _nickNameController;
  late TextEditingController _passwordController;

  // 설정 버튼 눌렀을때 수정 가능여부  => true : textFormField 수정 가능, false : textFormField 수정 불가능
  bool isChanged = false;

  // DB에서 받아온 개인정보로 초기화하고 그 내용이 처음 화면에 보입니다.
  @override
  void initState() {
    super.initState();
    // TextEditingController(text: ''); 이 곳에 불러온 개인정보 넣으시면 돼요.
    _accountController = TextEditingController(text: 'test@test.com');
    _nickNameController = TextEditingController(text: 'test');
    _passwordController = TextEditingController(text: 'testtest');
  }

  @override
  void dispose() {
    _accountController.dispose();
    _nickNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          // 우측 상단 설정 버튼 누르면 수정 가능하게 바뀌는 버튼
          IconButton(
            onPressed: () {
              setState(() {
                isChanged = !isChanged;
              });
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: const Text(
                '마이페이지',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                editMypageInfo(
                  const Text(
                    '계정',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  _accountController,
                  isChanged,
                ),
                editMypageInfo(
                  const Text(
                    '닉네임',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  _nickNameController,
                  isChanged,
                ),
                editMypageInfo(
                  const Text(
                    '비밀번호',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  _passwordController,
                  isChanged,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfffb8c00)),
                      // 뒤로 가기 기능 넣으시면 됩니다!
                      onPressed: () {},
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            '수정하기',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfff8f8f8)),
                      // 뒤로 가기 기능 넣으시면 됩니다!
                      onPressed: () {},
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            '뒤로가기',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget editMypageInfo(Widget widgetName,
    TextEditingController textEditingController, bool isChanged) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    decoration: BoxDecoration(
      color: const Color(0xfff8f8f8),
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 8.0,
          offset: const Offset(3, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widgetName,
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabled: isChanged,
          ),
        ),
      ],
    ),
  );
}