import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

import '../../../data/repository/like_recipe_repository_impl.dart';
import '../../model/like_model.dart';

class LikeAddRecipeUseCase {
  final LikeRecipeRepositoryImpl _likeRecipeRepositoryImpl;

  LikeAddRecipeUseCase({
    required LikeRecipeRepositoryImpl likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  Future<void> execute(LikeModel model) async {
    return await _likeRecipeRepositoryImpl.addItem(model);
  }

}
