import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingUpUiScreen extends StatefulWidget {
  const SingUpUiScreen({super.key});

  @override
  State<SingUpUiScreen> createState() => _SingUpUiScreenState();
}

class _SingUpUiScreenState extends State<SingUpUiScreen> {
  bool _isObscure = true;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: const Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                editTextField('user@gmail.com'),
                editTextField('Enter your number'),
                Stack(
                  children: [
                    editPasswordTextField('Enter your password', _isObscure),
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
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: const Color(0xfffb8c00),
                    side: const BorderSide(
                      color: Color(0xfffb8c00),
                      width: 2.0,
                    ),
                  ),
                  Text('Remember Me'),
                ],
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
                      onPressed: () {},
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Sign Up',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfff8f8f8)),
                      // 뒤로 가기 기능 넣으시면 됩니다!
                      onPressed: () {},
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Sign Up with Google',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/kakao_login_large_wide.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget editTextField(String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
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
    ),
  );
}

Widget editPasswordTextField(String hintText, bool isObscure) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
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
    ),
  );
}
