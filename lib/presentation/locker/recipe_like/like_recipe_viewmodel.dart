import 'package:flutter/cupertino.dart';
import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

import '../../../domain/use_case/like_recipe_use_case/like_remove_recipe_use_case.dart';

class LikeRecipeViewModel with ChangeNotifier {
  final LikeRemoveRecipeUseCase _likeRemoveRecipeUseCase;

  LikeRecipeViewModel({
    required LikeRemoveRecipeUseCase likeRemoveRecipeUseCase,
  }) : _likeRemoveRecipeUseCase = likeRemoveRecipeUseCase;

  void deleteLikeRecipe(LikeItem item) async {
    await _likeRemoveRecipeUseCase.execute(item);
  }

}