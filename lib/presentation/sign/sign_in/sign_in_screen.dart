import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Text('Hi, Welcome Back 🙌'),
          Text('Hello again, you\'ve been missed!'),
          Form(
              child: Column(
            children: [
              TextFormField(),
              SizedBox(
                height: 8,
              ),
              TextFormField(),
            ],
          )),
        ],
      ),
    );
  }
}
