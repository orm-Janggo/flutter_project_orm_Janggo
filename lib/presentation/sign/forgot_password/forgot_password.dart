import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String? inputEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 128,
          ),
          const Text(
            '비밀번호 찾기',
            style: TextStyle(fontSize: 32),
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'e.g. emailAddress@gmail.com',
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
              ],
            ),
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

                await _authentication.setLanguageCode("ko");
                await _authentication.sendPasswordResetEmail(
                    email: inputEmail.toString());

                // check mount
                if (!context.mounted) return;

                context.pushReplacement('/');
              },
              child: const Text(
                '재설정 이메일 보내기',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
