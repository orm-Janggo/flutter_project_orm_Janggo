import 'package:flutter_project_orm_janggo/domain/repository/recipe_repository.dart';

import '../data_source/gpt_data_source/gpt_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final GptDataSource _dataSource;

  const RecipeRepositoryImpl({
    required GptDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<String>> getRecipes(String ingredients) async {
    final recipe = await _dataSource.getRecipes(ingredients);
    return recipe;
  }

}