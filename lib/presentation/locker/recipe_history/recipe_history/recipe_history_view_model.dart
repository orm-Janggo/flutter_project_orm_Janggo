import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/data/db/history/history_recipe_data.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history/recipe_history_state.dart';
import 'package:hive/hive.dart';

class RecipeHistoryViewModel with ChangeNotifier {
  RecipeHistoryState _state = const RecipeHistoryState();

  RecipeHistoryState get state => _state;

  Future<void> getDataListFromHive() async {
    var box = await Hive.openBox<HistoryRecipeData>('historyRecipeBox');
    List<HistoryRecipeData> recipeList = box.values.toList();
    List<int> ids = [];
    List<String> imagePaths = [];
    List<String> recipes = [];
    List<String> dates = [];

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
        dates.add(recipeData.date);
      }
    }

    _state = _state.copyWith(
        id: ids, url: imagePaths, recipe: recipes, searchDate: dates);

    notifyListeners();
  }

  Future<void> deleteDataFromHive(int id) async {
    var box = await Hive.openBox<HistoryRecipeData>('historyRecipeBox');

    // id에 해당하는 recipe 찾기
    var recipe = box.values.firstWhere((recipe) => recipe.id == id);

    await recipe.delete();

    print('$id 번 레시피 삭제');

    notifyListeners();
  }

  Future<void> deleteAllDataFromHive() async {
    var box = await Hive.openBox<HistoryRecipeData>('historyRecipeBox');

    // 모든 데이터 삭제
    await box.clear();

    print('데이터 전체 삭제');

    notifyListeners();
  }

  String dateText(String date) {
    String? dateTextMessage;

    int searchDate = int.parse(date);

    int today = int.parse(
        '${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');

    if (today == searchDate) {
      dateTextMessage = '오늘';
    } else if (today - searchDate == 1) {
      dateTextMessage = '하루 전';
    } else {
      dateTextMessage = '${today - searchDate}일 전';
    }
    return dateTextMessage;
  }
}
