import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  bool isChecked = false;

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 128,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Welcome Back 🙌',
                style: TextStyle(fontSize: 32),
              ),
              Text(
                'Hello again, you\'ve been missed!',
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
                      email = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return '비밀번호를 입력해주세요.';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      password = value;
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
              const Text('Rember Me'),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password'),
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
                    email: email.toString(),
                    password: password.toString(),
                  );
                  debugPrint('로그인 성공');

                  if (!context.mounted) return;

                  context.push('/main');
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: const Text(
                'Sign in',
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
                'Sign in With Google',
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
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Sign in With KAKAO',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          SizedBox(
            width: 320,
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Don\'t have an account? Sign Up',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
