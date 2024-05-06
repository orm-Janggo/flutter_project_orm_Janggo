import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
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
  final _authentication = firebase_auth.FirebaseAuth.instance;

  // firebase_auth.User? _emailUser;

  String? originUserEmail;
  String? originUserDisplayName;
  String? userEmail;
  String? userDisplayName;
  String userPassword = '';

  final _accountController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _passwordController = TextEditingController();

  // 설정 버튼 눌렀을때 수정 가능여부  => true : textFormField 수정 가능, false : textFormField 수정 불가능
  bool isChanged = false;

  // Future<void> getEmailUser() async {
  //   _authentication.authStateChanges().listen((firebase_auth.User? emailUser) {
  //     if (emailUser != null) {
  //       _emailUser = emailUser;
  //       debugPrint('---마이페이지---');
  //       debugPrint(_emailUser.toString());
  //       debugPrint(_emailUser?.uid);
  //       print(_emailUser?.providerData[0]);
  //       debugPrint(_emailUser?.uid);
  //       debugPrint('----유저 정보----');
  //       debugPrint('${_emailUser?.email}, ${_emailUser?.displayName}');
  //       setState(() {});
  //       userEmail = _emailUser!.email;
  //       userDisplayName = _emailUser!.displayName;
  //     }
  //   });
  // }

  // void getSetUserInfo() async {
  //   await getEmailUser();
  //   _accountController.text = userEmail!;
  //   _nickNameController.text = userDisplayName!;
  // }

  // DB에서 받아온 개인정보로 초기화하고 그 내용이 처음 화면에 보입니다.
  @override
  void initState() {
    super.initState();
    // getSetUserInfo();
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
    final viewModel = context.watch<MyPageViewModel>();
    viewModel.getCurrentUserInfo();

    _accountController.text = viewModel.userEmail!;
    _nickNameController.text = viewModel.userDisplayName!;

    print('---test get current user---');
    print(viewModel.userEmail);

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
                          controller: _accountController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabled: false,
                          ),
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
                          controller: _nickNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabled: isChanged,
                          ),
                          onChanged: (String? value) {
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
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabled: isChanged,
                          ),
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
                          if (originUserDisplayName != userDisplayName) {
                            // _emailUser
                            //    ?.updateDisplayName(userDisplayName);
                            viewModel
                                .updateCurrentUserDisplayName(userDisplayName!);
                          }

                          if (userPassword != '') {
                            // _emailUser?.updatePassword(userPassword);
                            viewModel.updateCurrentUserPassword(userPassword);
                          }

                          if (!context.mounted) return;

                          // context.push('/main');
                        },
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff8f8f8)),
                        onPressed: () async {
                          await _authentication.signOut();

                          if (!context.mounted) return;

                          context.push('/');
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              '로그아웃',
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
      ),
    );
  }
}

// Widget editMypageInfo(
//     Widget widgetName,
//     TextEditingController textEditingController,
//     bool isChanged,
//     String? editVal) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//     margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//     decoration: BoxDecoration(
//       color: const Color(0xfff8f8f8),
//       borderRadius: BorderRadius.circular(16.0),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.3),
//           blurRadius: 8.0,
//           offset: const Offset(3, 3),
//         ),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         widgetName,
//         TextFormField(
//           controller: textEditingController,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             enabled: isChanged,
//           ),
//           onChanged: (String? value) {
//             editVal = value;
//           },
//         ),
//       ],
//     ),
//   );
// }
