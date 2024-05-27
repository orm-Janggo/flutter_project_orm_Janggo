import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

import '../../repository/like_recipe_repository.dart';

class LikeRemoveRecipeUseCase {
  final LikeRecipeRepository _likeRecipeRepositoryImpl;

  const LikeRemoveRecipeUseCase({
    required LikeRecipeRepository likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  Future<void> execute(LikeItem item) async {
    return await _likeRecipeRepositoryImpl.removeItem(item);
  }
}
