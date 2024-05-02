import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/kakao_login/kakao_login_ver2.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String? inputEmail;
  String? inputPassword;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '안녕하세요! 🙌',
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    '장고처리 어플을 사용해보세요!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
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
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '이메일 e.g. emailAddress@gmail.com',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return '이메일을 입력해주세요.';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          inputEmail = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        key: const ValueKey(2),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '비밀번호',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return '비밀번호를 입력해주세요.';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          inputPassword = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text('자동 로그인'),
                  TextButton(
                    onPressed: () {
                      context.push('/sign-in/forgot-password');
                    },
                    child: const Text('비밀번호 찾기'),
                  ),
                ],
              ),
              Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                    }

                    try {
                      await _authentication.signInWithEmailAndPassword(
                        email: inputEmail.toString(),
                        password: inputPassword.toString(),
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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    '구글로 로그인',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              getKakaoLoginButton(
                context,
              ),
              const SizedBox(
                height: 80,
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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
