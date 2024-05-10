import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';
import 'package:flutter_project_orm_janggo/data/repository/like_recipe_repository_impl.dart';

class LikeSearchRecipeUseCase{
  final LikeRecipeRepositoryImpl _likeRecipeRepositoryImpl;

  const LikeSearchRecipeUseCase({
    required LikeRecipeRepositoryImpl likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  Future<List<LikeItem>> execute(String query) async{
   return await _likeRecipeRepositoryImpl.search(query);
  }
}