import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/my_page/my_page_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  final _formKey = GlobalKey<FormState>();

  String? originUserEmail;
  String? originUserDisplayName;
  String? userEmail;
  String? userDisplayName;
  String userPassword = '';

  // 설정 버튼 눌렀을때 수정 가능여부  => true : textFormField 수정 가능, false : textFormField 수정 불가능
  bool isChanged = false;

  // DB에서 받아온 개인정보로 초기화하고 그 내용이 처음 화면에 보입니다.
  @override
  void initState() {
    super.initState();
    // getSetUserInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyPageViewModel>();
    viewModel.getCurrentUserInfo();

    debugPrint('---test get current user---');
    debugPrint(viewModel.userEmail);

    return Scaffold(
      appBar: AppBar(
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 16.0),
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
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
                          const Text(
                            '이메일',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          TextFormField(
                            // controller: _accountController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabled: false,
                            ),
                            style: TextStyle(fontFamily: 'school_font'),
                            initialValue: viewModel.userEmail,
                            onChanged: (String? value) {
                              userEmail = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
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
                          const Text(
                            '닉네임',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          TextFormField(
                            // controller: _nickNameController,
                            key: const ValueKey(1),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabled: isChanged,
                            ),
                            style: TextStyle(fontFamily: 'school_font'),
                            initialValue: viewModel.userDisplayName,
                            onChanged: (String? value) {
                              // _nickNameController.text = value!;
                              userDisplayName = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
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
                          const Text(
                            '비밀번호',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          TextFormField(
                            key: const ValueKey(2),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabled: isChanged,
                            ),
                            style: TextStyle(fontFamily: 'school_font'),
                            onChanged: (String? value) {
                              userPassword = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffb8c00)),
                          onPressed: () {
                            setState(() {
                              if (originUserDisplayName != userDisplayName) {
                                viewModel.updateCurrentUserDisplayName(
                                    userDisplayName!);
                              }

                              if (userPassword != '') {
                                viewModel
                                    .updateCurrentUserPassword(userPassword);
                              }

                              if (!context.mounted) return;

                              isChanged = !isChanged;
                            });

                            // context.push('/main');
                          },
                          child: const SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                '수정하기',
                                style: TextStyle(
                                    fontFamily: 'school_font',
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfff8f8f8)),
                          onPressed: () {
                            viewModel.signOutCurrentUser();

                            if (!context.mounted) return;

                            context.push('/');
                          },
                          child: const SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                '로그아웃',
                                style: TextStyle(
                                    fontFamily: 'school_font', fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfff8f8f8)),
                          // 뒤로 가기 기능 넣으시면 됩니다!
                          onPressed: () {
                            context.push('/main');
                          },
                          child: const SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                '뒤로가기',
                                style: TextStyle(
                                    fontFamily: 'school_font', fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16), // 여백 추가
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFDBA66),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // 패딩
                        foregroundColor: Colors.black,
                        // 텍스트 색상
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // 둥근 모서리
                        ),
                      ),
                      onPressed: () {
                        context.go('/main/my-page/app-information');
                      },
                      child: Text(
                        '앱 정보',
                        style: TextStyle(fontFamily: 'school_font'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
