import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/main.dart';
import 'package:flutter_project_orm_janggo/presentation/components/like_widget.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_like/like_recipe_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../data/db/like_hive/like_item.dart';

class LikeRecipeScreen extends StatefulWidget {
  const LikeRecipeScreen({super.key});

  @override
  State<LikeRecipeScreen> createState() => _LikeRecipeScreenState();
}

class _LikeRecipeScreenState extends State<LikeRecipeScreen> {
  late TextEditingController searchController = TextEditingController();
  late List<LikeItem> filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearchChanged);
    filteredRecipes = likeBox.values.toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged() {
    setState(() {
      filteredRecipes = likeBox.values
          .where((recipe) => recipe.foodName
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LikeRecipeViewModel>();

    void removeFromLikedRecipes(LikeItem recipe) {
      setState(() {
        viewModel.deleteLikeRecipe(recipe);
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: "좋아요 레시피 검색",
                    hintText: "레시피 이름 검색",
                    suffixIcon: IconButton(
                      onPressed: onSearchChanged, // 검색 아이콘 클릭 시 호출
                      icon: const Icon(Icons.search),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = filteredRecipes[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LikeWidget(
                        recipe: recipe,
                        onTap: () {
                          removeFromLikedRecipes(recipe);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ExpansionTile(
              backgroundColor: const Color(0xFFFDBA66),
              title: const Row(
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
                InkWell(
                  onTap: () {
                    context.push('/main/recipe-history');
                  },
                  child: const ListTile(
                    title: Center(
                      child: Text(
                        "레시피 히스토리 보관함",
                        style: TextStyle(fontFamily: 'school_font'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
