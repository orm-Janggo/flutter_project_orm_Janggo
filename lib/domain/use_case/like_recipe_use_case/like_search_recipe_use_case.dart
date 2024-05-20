import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';

import '../../repository/like_recipe_repository.dart';

class LikeSearchRecipeUseCase{
  final LikeRecipeRepository _likeRecipeRepositoryImpl;

  const LikeSearchRecipeUseCase({
    required LikeRecipeRepository likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  Future<List<LikeItem>> execute(String query) async{
   return await _likeRecipeRepositoryImpl.search(query);
  }
}