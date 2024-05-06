import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_view_model.dart';

class RecipeHistoryScreen extends StatefulWidget {
  const RecipeHistoryScreen({super.key});

  @override
  State<RecipeHistoryScreen> createState() => _RecipeHistoryScreenState();
}

class _RecipeHistoryScreenState extends State<RecipeHistoryScreen> {

  final List<Container> _controllers = [];

  void _removeHistory(int index) {
    setState(() {
      _controllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 스크린의 가로화면 사이즈
    final screenWidth = MediaQuery.of(context).size.width;
    // 스크린의 세로화면 사이즈
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFB8C00),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        color: const Color(0xffFB8C00),
        child: ListView.builder(
          itemCount: _controllers.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth * 0.3,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset('assets/images/empty_image.png')),
                  ),
                  Text('레시피 이름 $index'),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          _removeHistory(index);
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
