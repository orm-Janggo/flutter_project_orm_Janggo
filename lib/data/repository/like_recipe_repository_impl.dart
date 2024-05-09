import 'dart:async';

import '../../domain/repository/like_recipe_repository.dart';
import '../../main.dart';
import '../db/like_hive/like_item.dart';

class LikeRecipeRepositoryImpl implements LikeRecipeRepository {
  @override
  Future<void> addItem(LikeItem item) async {
    try {
      List<LikeItem> likeListItem = loadItem(item) ?? [];
      print('111111111111111');
      print(likeListItem);
      likeListItem.add(item);
      print(likeListItem);
      await likeBox.put('likeItem', likeListItem);
      print('add 확인용!!!');
    } catch (e) {
      print('아이템 추가 실패: $e');
      throw e;
    }
  }

  @override
  Future<void> removeItem(LikeItem item) async {
    try {
      await likeBox.delete(item);
    } catch (e) {
      print('아이템 삭제 실패: $e');
      throw e;
    }
  }

  @override
  Future<List<LikeItem>> search(String query) async {
    try {
      final items = likeBox
          .get('likeItem')
          ?.map((e) => e as LikeItem)
          .where((item) => item.recipe.contains(query))
          .toList();
      return items ?? [];
    } catch (e) {
      print('검색 실패: $e');
      throw e;
    }
  }

  @override
  List<LikeItem>? loadItem(LikeItem item) {
    return likeBox.get('likeItem');
  }
}
