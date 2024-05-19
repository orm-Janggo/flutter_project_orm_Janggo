import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_up/sign_up_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // String? inputEmail;
  // String? inputDisplayName;
  // String? inputPassword;
  // String? inputCheckPassword;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignUpViewModel>();

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
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 16.0),
                child: const Text(
                  '계정 생성',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: TextFormField(
                        key: const ValueKey(1),
                        decoration: InputDecoration(
                          hintText: '이메일 주소를 입력해 주세요',
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
                        onChanged: (String? value) {
                          // inputEmail = value;
                          viewModel.changeInputEmail(value!);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: TextFormField(
                        key: const ValueKey(2),
                        decoration: InputDecoration(
                          hintText: '닉네임',
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
                        inputFormatters: [
                          // Deny spaces
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return '닉네임을 입력해주세요.';
                          }

                          return null;
                        },
                        onChanged: (String? value) {
                          // inputDisplayName = value;
                          viewModel.changeInputDisplayName(value!);
                        },
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: TextFormField(
                            key: const ValueKey(3),
                            obscureText: viewModel.isObscure,
                            decoration: InputDecoration(
                              hintText: '비밀번호를 입력하세요',
                              hintStyle:
                                  const TextStyle(fontFamily: 'school_font'),
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
                                return '비밀번호를 입력해주세요.';
                              }
                              return null;
                            },
                            onChanged: (String? value) {
                              // inputPassword = value;
                              viewModel.changeInputPassword(value!);
                            },
                          ),
                        ),
                        Positioned(
                          right: 24.0,
                          bottom: 16.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                // _isObscure = !_isObscure;
                                viewModel.changeIsObscure();
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: TextFormField(
                            key: const ValueKey(4),
                            obscureText: viewModel.isCheckObscure,
                            decoration: InputDecoration(
                              hintText: '비밀번호 확인',
                              hintStyle:
                                  const TextStyle(fontFamily: 'school_font'),
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
                                return '비밀번호를 입력해주세요.';
                              }

                              if (value != viewModel.inputPassword) {
                                return '위와 동일한 비밀번호를 입력해주세요.';
                              }

                              return null;
                            },
                            onChanged: (String? value) {
                              // inputCheckPassword = value;
                              viewModel.changeInputCheckPassword(value!);
                            },
                          ),
                        ),
                        Positioned(
                          right: 24.0,
                          bottom: 16.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                // _isObscure = !_isObscure;
                                viewModel.changeIsCheckObscure();
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                ),
                child: SizedBox(
                  width: 320,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      context.push('/sign-in');
                    },
                    child: const Text(
                      '계정이 있으신가요? 로그인',
                      style: TextStyle(fontSize: 16, fontFamily: 'school_font'),
                    ),
                  ),
                ),
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
                        // sign up 기능 추가, _isChecked 가 true 면 계정을 기억하도록
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                          }

                          try {
                            await viewModel.signUpWithFirebaseAuth(
                              viewModel.inputEmail!,
                              viewModel.inputPassword!,
                              viewModel.inputDisplayName!,
                            );

                            if (!context.mounted) return;
                            context.push('/main');
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  '회원가입이 정상적으로 이루어지지 않았습니다.\n입력하신 정보를 확인해 주세요.',
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: const SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              '회원 가입',
                              style: TextStyle(
                                  fontFamily: 'school_font',
                                  color: Colors.black,
                                  fontSize: 20),
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
