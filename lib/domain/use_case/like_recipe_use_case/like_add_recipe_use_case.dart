import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

import '../../../data/repository/like_recipe_repository_impl.dart';

class LikeAddRecipeUseCase {
  final LikeRecipeRepositoryImpl _likeRecipeRepositoryImpl;

  LikeAddRecipeUseCase({
    required LikeRecipeRepositoryImpl likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  Future<void> execute(LikeItem item) async {
    // 레시피 텍스트에서 음식 이름 추출
    String foodName = _extractFoodName(item.recipe);

    final updatedItem = item.copyWith(
      foodName: foodName,
      recipe: _removeFoodName(item.recipe, foodName),
    );

    await _likeRecipeRepositoryImpl.addItem(updatedItem);
  }

  String _extractFoodName(String recipe) {
    List<String> lines = recipe.split('\n');

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i].trim();

      if (line.isEmpty || line.toLowerCase().contains('레시피')) {
        continue;
      }

      if (line.startsWith(RegExp(r'\d+\. '))) {
        line = line.substring(line.indexOf(' ') + 1);
      }

      if (line.length > 20) {
        break;
      }

      return line;
    }

    return '';
  }

  String _removeFoodName(String recipe, String foodName) {
    return recipe.replaceFirst(foodName, '').trim();
  }
}
