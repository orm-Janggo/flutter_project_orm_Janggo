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
          SizedBox(
            height: 128,
          ),
          Text('Hi, Welcome Back 🙌'),
          Text('Hello again, you\'ve been missed!'),
          SizedBox(
            height: 16,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
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
                TextFormField(
                  decoration: InputDecoration(
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
              Text('Rember Me'),
              TextButton(
                onPressed: () {},
                child: Text('Forgot Password'),
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

                  context.push('/temp-screen');
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
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
              child: Text(
                'Sign in With Google',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
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
              child: Text(
                'Sign in With KAKAO',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            width: 320,
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: Text(
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
