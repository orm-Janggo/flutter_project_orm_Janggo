import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatelessWidget {
  const QuestionAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Q&A',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                qNa(
                  '레시피는 어떻게 검색하나요?',
                  '메인 화면에서 재료를 마음껏 작성하세요.\n그리고 레시피 확인을 누르면 레시피를 추천해드립니다!',
                ),
                const SizedBox(
                  height: 16,
                ),
                qNa(
                  '비밀번호를 잃어버리셨나요?',
                  '로그인 화면에서 forgot password를 클릭해서 비밀번호를 찾으세요!',
                ),
                const SizedBox(
                  height: 16,
                ),
                qNa(
                  '레시피가 제대로 안나와요.',
                  '레시피는 Ai를 사용하기 때문에 실수를 할 수 있습니다. \n좀 더 나은 서비스제공을 위해 더 노력해볼께요!',
                ),
                qNa(
                  '음식사진이 제대로 안나와요.',
                  '음식사진은 외국 이미지 검색 연결 사용하기 때문에,\n 가끔 우리나라 음식에 대한 사진을 못가져올 때가 있어요 ㅠ',
                ),
                const SizedBox(
                  height: 16,
                ),
                qNa(
                  '검색한 레시피들은 어디서 보나요?',
                  ' 레시피 검색 후 상단 메뉴 버튼을 누르시면, 좋아요 기록까지 볼 수 있습니다!',
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget qNa(String title, String description) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          description,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
