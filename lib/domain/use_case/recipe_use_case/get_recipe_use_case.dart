import '../../repository/recipe_repository.dart';

class GetRecipeUseCase {
  final RecipeRepository _chatGptRepositoryImpl;

  const GetRecipeUseCase({
    required RecipeRepository chatGptRepositoryImpl,
  }) : _chatGptRepositoryImpl = chatGptRepositoryImpl;

  Future<List<String>> execute(String ingredients) async {
    final recipe = await _chatGptRepositoryImpl.getRecipes(ingredients);
    return recipe;
  }
}
