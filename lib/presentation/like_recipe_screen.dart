import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LikeRecipeScreen extends StatefulWidget {
  const LikeRecipeScreen({super.key});

  @override
  State<LikeRecipeScreen> createState() => _LikeRecipeScreenState();
}

class _LikeRecipeScreenState extends State<LikeRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('레시피 좋아요 보관함'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/main/my-page');
            },
            icon: Icon(Icons.face),
          ),
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
