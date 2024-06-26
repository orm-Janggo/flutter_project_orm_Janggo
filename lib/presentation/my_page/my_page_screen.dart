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

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyPageViewModel>();
    viewModel.fetchCurrentUserInfo();

    debugPrint('---test get current user---');
    debugPrint(viewModel.firebaseUser?.email.toString());

    return Scaffold(
      appBar: AppBar(
        actions: [
          // 우측 상단 설정 버튼 누르면 수정 가능하게 바뀌는 버튼
          IconButton(
            onPressed: () {
              setState(() {
                viewModel.changeCanModify();
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
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabled: false,
                            ),
                            style: const TextStyle(fontFamily: 'school_font'),
                            initialValue: viewModel.firebaseUser?.email,
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
                              enabled: viewModel.isChange,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.edit_note_outlined),
                                onPressed: () {
                                  viewModel.updateCurrentUserDisplayName(
                                      viewModel.userDisplayName!);
                                  viewModel.changeCanModify();
                                },
                              ),
                            ),
                            style: const TextStyle(fontFamily: 'school_font'),
                            initialValue: viewModel.firebaseUser?.displayName,
                            onChanged: (String? value) {
                              viewModel.changeUserDisplayName(value!);
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
                              enabled: viewModel.isChange,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.edit_note_outlined),
                                onPressed: () {
                                  viewModel.updateCurrentUserPassword(
                                      viewModel.userPassword!);
                                  viewModel.changeCanModify();
                                },
                              ),
                            ),
                            style: const TextStyle(fontFamily: 'school_font'),
                            onChanged: (String? value) {
                              viewModel.changeUserPassword(value!);
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
                            horizontal: 16.0, vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfff8f8f8)),
                          onPressed: () {
                            viewModel.signOutCurrentUser();

                            if (!context.mounted) return;

                            context.push('/main/recipe-like');
                          },
                          child: const SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                '레시피 보관함',
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
                                '메인 화면',
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
                    padding: const EdgeInsets.only(right: 16), // 여백 추가
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFFDBA66),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20), // 패딩
                        foregroundColor: Colors.black,
                        // 텍스트 색상
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // 둥근 모서리
                        ),
                      ),
                      onPressed: () {
                        context.go('/main/my-page/app-information');
                      },
                      child: const Text(
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
