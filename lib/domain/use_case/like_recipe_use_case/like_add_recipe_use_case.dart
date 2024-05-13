import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

import '../../../data/repository/like_recipe_repository_impl.dart';

class LikeAddRecipeUseCase {
  final LikeRecipeRepositoryImpl _likeRecipeRepositoryImpl;

  LikeAddRecipeUseCase({
    required LikeRecipeRepositoryImpl likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  Future<void> execute(LikeItem item) async {
    return await _likeRecipeRepositoryImpl.addItem(item);
  }

}
