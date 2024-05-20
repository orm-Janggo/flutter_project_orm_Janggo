abstract interface class RecipeRepository {
  Future<List<String>> getRecipes(String ingredients);
}