import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_state.dart';
import 'package:hive/hive.dart';

import '../../../data/db/history/history_recipe_data.dart';

class RecipeHistoryViewModel with ChangeNotifier {
  RecipeHistoryState _state = const RecipeHistoryState();

  RecipeHistoryState get state => _state;

  Future<void> getDataListFromHive() async {
    var box = await Hive.openBox<HistoryRecipeData>('historyRecipeBox');
    List<HistoryRecipeData> recipeList = box.values.toList();
    List<int> ids = [];
    List<String> imagePaths = [];
    List<String> recipes = [];

    if (recipeList != []) {
      for (var recipeData in recipeList) {
        ids.add(recipeData.id);
        imagePaths.add(recipeData.imagePath);
        List<String> sentences = recipeData.recipe.split('\n');
        String recipeName = '';
        if (sentences.first.contains('레시피')) {
          recipeName = sentences[2];
        } else {
          recipeName = sentences.first;
        }
        recipes.add(recipeName);
      }
    }

    _state = _state.copyWith(id: ids, url: imagePaths, recipe: recipes);

    notifyListeners();
  }
}
