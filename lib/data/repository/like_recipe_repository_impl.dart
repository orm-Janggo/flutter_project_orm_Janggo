import 'package:hive/hive.dart';

import '../../domain/repository/like_recipe_repository.dart';
import '../db/like_hive/like_item.dart';

class LikeRecipeRepositoryImpl implements LikeRecipeRepository {
  late Box<LikeItem> likeBox;

  @override
  Future<void> addItem(LikeItem item) async {
    try {
      await likeBox.add(item);
    } catch (e) {
      print('아이템 추가 실패: $e');
      throw e;
    }
  }

  @override
  Future<void> removeItem(LikeItem item) async {
    try {
      await likeBox.deleteAt(item.key);
    } catch (e) {
      print('아이템 삭제 실패: $e');
      throw e;
    }
  }

  @override
  Future<List<LikeItem>> search(String query) async {
    try {
      final items =
          likeBox.values.where((item) => item.recipe.contains(query)).toList();
      return items;
    } catch (e) {
      print('검색 실패: $e');
      throw e;
    }
  }

  @override
 LikeItem? loadItem(LikeItem item) {
   return likeBox.get(item.key);
  }
}
