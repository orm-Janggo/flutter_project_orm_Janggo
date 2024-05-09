import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatelessWidget {
  const QuestionAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: const Text(
              'Q&A',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Qna(
            '레시피는 어떻게 검색하나요?',
            '메인 화면에서 재료를 마음껏 작성하세요. 그리고 레시피 확인을 누르면 레시피를 추천해드립니다!',
          ),
          SizedBox(
            height: 16,
          ),
          Qna(
            '비밀번호를 잃어버리셨나요?',
            '로그인 화면에서 forgot password를 클릭해서 비밀번호를 찾으세요!',
          ),
          SizedBox(
            height: 16,
          ),
          Qna(
            '이미지가 안나와요.',
            '이미지는 외국 이미지 검색 Api를 사용하기 때문에 가끔 우리나라 음식에 대한 사진을 못가져올 때가 있어요 ㅠ',
          ),
          SizedBox(
            height: 16,
          ),
          Qna(
            '제가 검색한 레시피들은 어디서 보나요?',
            '마이페이지에서 레시피 검색 기록 버튼을 누르시면 좋아요 기록까지 볼 수 있습니다!',
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

Widget Qna(String title, String description) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          description,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    ],
  );
}
