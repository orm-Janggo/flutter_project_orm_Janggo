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

  String? inputEmail;
  String? inputDisplayName;
  String? inputPassword;
  String? inputCheckPassword;

  bool _isObscure = true;

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
                          hintText: '이메일 e.g. email@gmail.com',
                          hintStyle: TextStyle(fontFamily: 'school_font'),
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
                        style: TextStyle(fontFamily: 'school_font'),
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return '이메일을 입력해주세요.';
                          }
                          return null;
                        },
                        onChanged: (String? value) {
                          inputEmail = value;
                        },
                        onSaved: (String? value) {
                          inputEmail = value;
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
                          hintStyle: TextStyle(fontFamily: 'school_font'),
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
                        style: TextStyle(fontFamily: 'school_font'),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          // Deny spaces
                        ],
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return '닉네임을 입력해주세요.';
                          }

                          return null;
                        },
                        onChanged: (String? value) {
                          inputDisplayName = value;
                        },
                        onSaved: (String? value) {
                          inputDisplayName = value;
                        },
                      ),
                    ),
                    // editPasswordTextField(
                    //     '비밀번호를 입력하세요', _isObscure, inputPassword),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: TextFormField(
                            key: const ValueKey(3),
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              hintText: '비밀번호를 입력하세요',
                              hintStyle: TextStyle(fontFamily: 'school_font'),
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
                            style: TextStyle(fontFamily: 'school_font'),
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return '비밀번호를 입력해주세요.';
                              }
                              return null;
                            },
                            onChanged: (String? value) {
                              inputPassword = value;
                            },
                            onSaved: (String? value) {
                              inputPassword = value;
                            },
                          ),
                        ),
                        Positioned(
                          right: 24.0,
                          bottom: 16.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
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
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              hintText: '비밀번호 확인',
                              hintStyle: TextStyle(fontFamily: 'school_font'),
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
                            style: TextStyle(fontFamily: 'school_font'),
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return '비밀번호를 입력해주세요.';
                              }

                              if (value != inputPassword) {
                                return '위와 동일한 비밀번호를 입력해주세요.';
                              }

                              return null;
                            },
                            onChanged: (String? value) {
                              inputCheckPassword = value;
                            },
                            onSaved: (String? value) {
                              inputCheckPassword = value;
                            },
                          ),
                        ),
                        Positioned(
                          right: 24.0,
                          bottom: 16.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
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
                              inputEmail!,
                              inputPassword!,
                              inputDisplayName!,
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
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              '회원 가입',
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

// Widget editIdTextField(String hintText, inputEmail) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//     child: TextFormField(
//       key: const ValueKey(1),
//       decoration: InputDecoration(
//         hintText: hintText,
//         filled: true,
//         fillColor: const Color(0xfff8f8f8),
//         border: InputBorder.none,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16.0),
//           borderSide: const BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16.0),
//           borderSide: const BorderSide(
//             color: Color(0xfffb8c00),
//           ),
//         ),
//       ),
//       validator: (value) {
//         if (value?.isEmpty ?? false) {
//           return '이메일을 입력해주세요.';
//         }
//         return null;
//       },
//       onSaved: (String? value) {
//         inputEmail = value;
//       },
//     ),
//   );
// }
//
// Widget editPasswordTextField(String hintText, bool isObscure, inputPassword) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//     child: TextFormField(
//       key: const ValueKey(2),
//       obscureText: isObscure,
//       decoration: InputDecoration(
//         hintText: hintText,
//         filled: true,
//         fillColor: const Color(0xfff8f8f8),
//         border: InputBorder.none,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16.0),
//           borderSide: const BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16.0),
//           borderSide: const BorderSide(
//             color: Color(0xfffb8c00),
//           ),
//         ),
//       ),
//       validator: (value) {
//         if (value?.isEmpty ?? false) {
//           return '비밀번호를 입력해주세요.';
//         }
//         return null;
//       },
//       onSaved: (String? value) {
//         inputPassword = value;
//       },
//     ),
//   );
// }
//
// Widget editCheckPasswordTextField(
//     String hintText, bool isObscure, inputPassword, inputCheckPassword) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//     child: TextFormField(
//       key: const ValueKey(3),
//       obscureText: isObscure,
//       decoration: InputDecoration(
//         hintText: hintText,
//         filled: true,
//         fillColor: const Color(0xfff8f8f8),
//         border: InputBorder.none,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16.0),
//           borderSide: const BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16.0),
//           borderSide: const BorderSide(
//             color: Color(0xfffb8c00),
//           ),
//         ),
//       ),
//       validator: (value) {
//         if (value?.isEmpty ?? false) {
//           return '비밀번호를 입력해주세요.';
//         }
//
//         if (value != inputPassword) {
//           return '위와 동일한 비밀번호를 입력해주세요.';
//         }
//
//         return null;
//       },
//       onSaved: (String? value) {
//         inputCheckPassword = value;
//       },
//     ),
//   );
// }
