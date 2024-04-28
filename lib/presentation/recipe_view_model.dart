import 'package:flutter/foundation.dart';
import 'package:flutter_project_orm_janggo/domain/model/picture_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_picture_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/recipe_state.dart';

class RecipeViewModel with ChangeNotifier{
  final GetPictureUseCase _getPictureUseCase;
  final GetRecipeUseCase _getRecipeUseCase;

  PictureModel? _picture;

  PictureModel? get picture => _picture;

  RecipeViewModel({
    required GetPictureUseCase getPictureUseCase,
    required GetRecipeUseCase getRecipeUseCase,
  })  : _getPictureUseCase = getPictureUseCase,
        _getRecipeUseCase = getRecipeUseCase;

  RecipeState _state = RecipeState();

  RecipeState get state => _state;

  Future<PictureModel> getPicture(String query) async {
    final pic = await _getPictureUseCase.execute(query);
    return pic;
  }

  void getRecipe(String ingredients) async {
    print("Executing use case with ingredients: $ingredients");
    final recipe = await _getRecipeUseCase.execute(ingredients);
    _state = _state.copyWith(
      recipe: recipe
    );
    print(_state.recipe);

    notifyListeners();
  }

}
