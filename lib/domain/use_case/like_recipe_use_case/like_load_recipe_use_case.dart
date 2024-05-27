import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

import '../../repository/like_recipe_repository.dart';

class LikeLoadRecipeUseCase {
  final LikeRecipeRepository _likeRecipeRepositoryImpl;

  const LikeLoadRecipeUseCase({
    required LikeRecipeRepository likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  List<LikeItem> execute(LikeItem item) {
    return _likeRecipeRepositoryImpl.loadItem(item);
  }
}
