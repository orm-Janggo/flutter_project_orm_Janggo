import 'package:flutter/material.dart';

class RecipeHistoryDetailScreen extends StatefulWidget {
  const RecipeHistoryDetailScreen({super.key});

  @override
  State<RecipeHistoryDetailScreen> createState() =>
      _RecipeHistoryDetailScreenState();
}

class _RecipeHistoryDetailScreenState extends State<RecipeHistoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // 스크린의 가로화면 사이즈
    final screenWidth = MediaQuery.of(context).size.width;
    // 스크린의 세로화면 사이즈
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 265,
              width: 400,

              // image 받아오면 삼항연산자 사용해서 default image or recipe image 띄우기 기능 추가예정
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/empty_image.png',
                    height: 265,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '레시피 들어갈 곳',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'hand_font',
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
