import 'package:flutter_project_orm_janggo/data/repository/recipe_repository_impl.dart';

class GetRecipeUseCase {
  final RecipeRepositoryImpl _chatGptRepositoryImpl;

  const GetRecipeUseCase({
    required RecipeRepositoryImpl chatGptRepositoryImpl,
  }) : _chatGptRepositoryImpl = chatGptRepositoryImpl;

  Future<List<String>> execute(String ingredients) async {
    final recipe = await _chatGptRepositoryImpl.getRecipes(ingredients);
    return recipe;
  }

}