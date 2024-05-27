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
