import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppInformationScreen extends StatelessWidget {
  const AppInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                vertical: 32.0, horizontal: 16.0),
            child: const Text(
              '앱 정보',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff8f8f8)),
              onPressed: () {
                context.push('/main/my-page/app-information/qna');
              },
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Q&A',
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff8f8f8)),
              onPressed: () {
                context.push('/main/my-page/app-information/privacy');
              },
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    '개인정보처리방침',
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff8f8f8)),
              onPressed: () {
                context.push('/main/my-page/app-information/license');
              },
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    '오픈소스 라이선스',
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
        ],
      ),
    );
  }
}
