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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. emailAddress@gmail.com',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _passwordTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
              ),
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
                try {
                  await _authentication.signInWithEmailAndPassword(
                    email: _emailTextEditingController.text,
                    password: _passwordTextEditingController.text,
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
