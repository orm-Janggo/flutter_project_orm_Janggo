import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_in/sign_in_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'google/google_sign_in.dart';
import '../../components/kakao_login_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignInViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 16.0),
                child: const Column(
                  children: [
                    Text(
                      '안녕하세요! 👋',
                      style: TextStyle(
                        fontSize: 32.0,
                      ),
                    ),
                    Text(
                      '장고처리 어플을 사용해보세요!',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        key: const ValueKey(1),
                        decoration: InputDecoration(
                          hintText: '이메일 주소를 입력하세요.',
                          hintStyle: const TextStyle(fontFamily: 'school_font'),
                          filled: true,
                          fillColor: const Color(0xfff8f8f8),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: Color(0xfffb8c00),
                            ),
                          ),
                        ),
                        style: const TextStyle(fontFamily: 'school_font'),
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return '이메일을 입력해주세요.';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          // inputEmail = value;
                          viewModel.changeInputEmail(value!);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        key: const ValueKey(2),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                viewModel.changeIsObscure();
                              });
                            },
                          ),
                          hintText: '비밀번호',
                          hintStyle: const TextStyle(fontFamily: 'school_font'),
                          filled: true,
                          fillColor: const Color(0xfff8f8f8),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: Color(0xfffb8c00),
                            ),
                          ),
                        ),
                        style: const TextStyle(fontFamily: 'school_font'),
                        obscureText: viewModel.isObscure,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return '비밀번호를 입력해주세요.';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          viewModel.changeInputPassword(value!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: viewModel.isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            viewModel.changeIsChecked();
                          });
                        },
                      ),
                      const Text('자동 로그인'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      context.push('/sign-in/forgot-password');
                    },
                    child: const Text(
                      '비밀번호 찾기',
                      style: TextStyle(fontSize: 14, fontFamily: 'school_font'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 320,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    context.push('/sign-up');
                  },
                  child: const Text(
                    '계정이 없으신가요? 회원가입',
                    style: TextStyle(fontSize: 16, fontFamily: 'school_font'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                      }

                      try {
                        await viewModel.signInWithFirebaseAuth(
                          viewModel.inputEmail!,
                          viewModel.inputPassword!,
                        );
                        debugPrint('로그인 성공');
                        // check mount
                        if (!context.mounted) return;

                        context.push('/main');
                      } catch (e) {
                        debugPrint(e.toString());

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              '로그인이 정상적으로 이루어지지 않았습니다.\n입력하신 정보를 확인해 주세요.',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'school_font',
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: googleLoginButton(
                    context,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: KakaoLoginButton(
                  onTap: () async {
                    await viewModel.signInWithKakao();
                    if (viewModel.isKakaoLogined) {
                      if (!context.mounted) return;

                      context.push('/main');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
