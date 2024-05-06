import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RecipeHistoryScreen extends StatefulWidget {
  const RecipeHistoryScreen({super.key});

  @override
  State<RecipeHistoryScreen> createState() => _RecipeHistoryScreenState();
}

class _RecipeHistoryScreenState extends State<RecipeHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // 가로화면 사이즈
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFB8C00),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        color: const Color(0xffFB8C00),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return HistoryRecipeListTile(context, index);
          },
        ),
      ),
    );
  }
}

Widget HistoryRecipeListTile(context, int index) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Container(
    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
    padding: EdgeInsets.all(screenWidth * 0.03),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0)
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenWidth * 0.3,
          child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset('assets/images/empty_image.png')),
        ),
        Text('레시피 이름 $index'),
        Column(
          children: [
            IconButton(
              onPressed: () {},
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
}
