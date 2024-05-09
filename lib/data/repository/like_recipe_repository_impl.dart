import 'dart:async';
import 'dart:convert';

import '../../domain/repository/like_recipe_repository.dart';
import '../../main.dart';
import '../db/like_hive/like_item.dart';

class LikeRecipeRepositoryImpl implements LikeRecipeRepository {
  @override
  Future<void> addItem(LikeItem item) async {
    try {
      List<LikeItem> likeListItem = loadItem(item);
      print('111111111111111');
      print(likeListItem);
      likeListItem.add(item);
      print(likeListItem);

      await likeBox.put('likeItem', jsonEncode(likeListItem.map((e) => e.toMap()).toList()));
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
      List<LikeItem> result = [];

      final items = likeBox.get('likeItem');
      if (items == null) {
        return result;
      }
      return (jsonDecode(items) as List<LikeItem>)
          .where((item) => item.recipe.contains(query))
          .toList();
    } catch (e) {
      print('검색 실패: $e');
      throw e;
    }
  }

  @override
  List<LikeItem> loadItem(LikeItem item) {
    String? loadItems = likeBox.get('likeItem');
    if (loadItems == null) {
      return [];
    }
    return (jsonDecode(loadItems) as List).map((e) => LikeItem.fromMap(e as Map<String,dynamic>)).toList();
  }
}
