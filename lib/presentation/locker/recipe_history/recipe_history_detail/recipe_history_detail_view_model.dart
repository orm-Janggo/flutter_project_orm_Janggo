import 'package:flutter/cupertino.dart';
import 'package:flutter_project_orm_janggo/data/db/history/history_recipe_data.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_detail/recipe_history_detail_state.dart';
import 'package:hive/hive.dart';

class RecipeHistoryDetailViewModel with ChangeNotifier{
  RecipeHistoryDetailState _state = const RecipeHistoryDetailState();

  RecipeHistoryDetailState get state => _state;


  Future<void> getDetailDataListFromHive(int id) async {
    var box = await Hive.openBox<HistoryRecipeData>('historyRecipeBox');
    List<HistoryRecipeData> recipeList = box.values.toList();

    int detailId = 0;
    String detailImagePath = '';
    String detailRecipe = '';

    for (var recipeData in recipeList) {
      if (recipeData.id == id) {
        detailId = recipeData.id;
        detailImagePath = recipeData.imagePath;
        detailRecipe = recipeData.recipe;
        break; // 일치하는 레시피를 찾았으므로 반복문 종료
      }
    }

    print('======================================id: $detailId, url: $detailImagePath, recipe: $detailRecipe');

    _state = _state.copyWith(id: detailId, url: detailImagePath, recipe: detailRecipe);

    notifyListeners();
  }
}