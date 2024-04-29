import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project_orm_janggo/presentation/recipe_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../domain/model/picture_model.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({
    super.key,
    required this.ingredients,
  });

  final String ingredients;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  void initState() {
    super.initState();

    final ingredients = widget.ingredients;

    context.read<RecipeViewModel>().getRecipe(ingredients);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeViewModel>();
    final state = viewModel.state;
    if (state.recipe != null) {
      viewModel.getPicture(state.recipe);
      setState(() {});
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('레시피'),
      ),
      body: PageView.builder(
        itemCount: state.recipe.length, // 레시피 수에 따라 페이지 생성
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (state.url.isNotEmpty && index < state.url.length && state.url[index] != 'empty')
                      ? Image.network(
                          state.url[index], // 이미지 URL
                          height: 400, // 이미지 높이
                          width: 400,
                          fit: BoxFit.cover,
                        )
                      : Image.asset('assets/images/empty_image.png'), // 이미지가 없을 경우 대체 이미지
                ),
                Expanded(
                  // 스크롤뷰가 확장
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            blurRadius: 8.0,
                            offset: const Offset(3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        state.recipe[index], // 레시피 텍스트
                        style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
