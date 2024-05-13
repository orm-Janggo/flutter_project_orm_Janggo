import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

import '../../../data/repository/like_recipe_repository_impl.dart';

class LikeLoadRecipeUseCase {
  final LikeRecipeRepositoryImpl _likeRecipeRepositoryImpl;

  const LikeLoadRecipeUseCase({
    required LikeRecipeRepositoryImpl likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  List<LikeItem>execute(LikeItem item) {
    return _likeRecipeRepositoryImpl.loadItem(item);
  }
}
