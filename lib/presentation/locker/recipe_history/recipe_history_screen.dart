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
    num respWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFB8C00),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: respWidth * 0.05),
        color: Color(0xffFB8C00),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return HistoryRecipeListTile(context, index);
          },
        ),
      ),
    );
  }
}

Widget HistoryRecipeListTile(context, int index) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
    color: Colors.white,
    height: 50,
    child: Text('$index'),
  );
}