import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

import '../../../data/repository/like_recipe_repository_impl.dart';
import '../../model/like_model.dart';
import '../../repository/like_recipe_repository.dart';

class LikeAddRecipeUseCase {
  final LikeRecipeRepository _likeRecipeRepositoryImpl;

  LikeAddRecipeUseCase({
    required LikeRecipeRepository likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  Future<void> execute(LikeModel model) async {
    return await _likeRecipeRepositoryImpl.addItem(model);
  }

}
