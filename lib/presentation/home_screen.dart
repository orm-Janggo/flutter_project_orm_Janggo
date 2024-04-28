import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            // 첫 번째 Container 안에 배치되는 위젯들
          ),

          Positioned(
            bottom: 180, // 원하는 위치로 조정
            left: 50, // 원하는 위치로 조정
            child: Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white70,
              ),
              child: TextButton(
                onPressed: () {
                  context.push('/main');
                },
                child: Text(
                  "Let's go",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100, // 원하는 위치로 조정
            left: 50, // 원하는 위치로 조정
            child: Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.orange,
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
