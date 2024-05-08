import 'package:flutter/foundation.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_picture_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/recipe_screen/recipe_state.dart';

class RecipeViewModel with ChangeNotifier {
  final GetPictureUseCase _getPictureUseCase;
  final GetRecipeUseCase _getRecipeUseCase;
  bool isLike = false;

  RecipeViewModel({
    required GetPictureUseCase getPictureUseCase,
    required GetRecipeUseCase getRecipeUseCase,
  })  : _getPictureUseCase = getPictureUseCase,
        _getRecipeUseCase = getRecipeUseCase;

  RecipeState _state = const RecipeState();

  RecipeState get state => _state;


  void getPicture(List<String> query) async {
    if (_state.url.length == query.length) {
      // 검색이 이미 완료되었다면 추가 검색을 방지
      return;
    }
    List<String> images = [];
    try {
      for (String recipe in query) {
        final recipeTitle = recipe.split('\n')[0].trim();
        final pic = await _getPictureUseCase.execute(recipeTitle);

        if (pic == null || pic.url == null || pic.url.isEmpty) {
          images.add("empty"); // 이미지가 없는 경우
        } else {
          images.add(pic.url); // 이미지 URL 추가
        }
      }

      _state = _state.copyWith(url: images);
      print(_state.url);
      notifyListeners();
    } catch (e) {
      print("Error in getPicture: $e"); // 예외 처리
    }
  }

  void getRecipe(String ingredients) async {
    final recipe = await _getRecipeUseCase.execute(ingredients);
    _state = _state.copyWith(recipe: recipe);
    notifyListeners();
  }

}
