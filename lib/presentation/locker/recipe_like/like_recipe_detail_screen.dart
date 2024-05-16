import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

class LikeRecipeDetailScreen extends StatefulWidget {
  final LikeItem recipe;

  const LikeRecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  State<LikeRecipeDetailScreen> createState() => _LikeRecipeDetailScreenState();
}

class _LikeRecipeDetailScreenState extends State<LikeRecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.recipe.foodName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // 현재 화면을 pop하여 이전 화면으로 이동
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recipe Detail Screen',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 네비게이션 로직 추가
              },
              child: Text('Go to Like Recipe Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
