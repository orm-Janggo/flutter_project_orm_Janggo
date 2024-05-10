import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';
import 'package:flutter_project_orm_janggo/data/repository/like_recipe_repository_impl.dart';

class LikeRemoveRecipeUseCase{
  final LikeRecipeRepositoryImpl _likeRecipeRepositoryImpl;

  const LikeRemoveRecipeUseCase({
    required LikeRecipeRepositoryImpl likeRecipeRepositoryImpl,
  }) : _likeRecipeRepositoryImpl = likeRecipeRepositoryImpl;

  Future<void> execute(LikeItem item) async{
    return await _likeRecipeRepositoryImpl.removeItem(item);
  }
}