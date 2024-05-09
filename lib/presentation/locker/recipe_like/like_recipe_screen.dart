
import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/components/like_widget.dart';
import 'package:provider/provider.dart';

import '../../recipe_screen/recipe_view_model.dart';

class LikeRecipeScreen extends StatelessWidget {
  const LikeRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeViewModel>();

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "좋아요 레시피 검색",
                    hintText: "레시피 이름 검색",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 750,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.likeItems.length,
                  itemBuilder: (context, index) {
                    final recipe = viewModel.likeItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LikeWidget(recipe :recipe),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Positioned(
              top: 50,
              child: ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "레시피 좋아요 보관함",
                      style: TextStyle(fontFamily: 'school_font'),
                    ),
                  ],
                ),
                children: [
                  for (final recipe in viewModel.likeItems)
                    Container(
                      color: Colors.black,
                      child: ListTile(
                        title: Text(
                          recipe!.recipe,
                          style: TextStyle(
                            fontFamily: 'school_font',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
