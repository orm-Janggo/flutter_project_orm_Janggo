import 'dart:async';

import 'package:hive/hive.dart';

import '../../domain/repository/like_recipe_repository.dart';
import '../../main.dart';
import '../db/like_hive/like_item.dart';

class LikeRecipeRepositoryImpl implements LikeRecipeRepository {
  @override
  Future<void> addItem(LikeItem item) async {
    try {
      List<LikeItem> likeListItem = await loadItem(item);
      likeListItem.add(item);
      // 각 아이템을 개별적으로 Hive 데이터베이스에 저장
      for (var item in likeListItem) {
        await likeBox.put(item.id, item);
        print('LikeItem: ${item.toString()}');
      }
    } catch (e) {
      print('아이템 추가 실패: $e');
      throw e;
    }
  }


  @override
  Future<void> removeItem(LikeItem item) async {
    List<LikeItem> likeListItem = loadItem(item);
    try {
      await likeBox.delete(item.id);
      for (var likeItem in likeListItem) {
        // 각 아이템을 출력
        print('LikeItem: ${likeItem.toString()}');
      }
    } catch (e) {
      print('아이템 삭제 실패: $e');
      throw e;
    }
  }

  @override
  Future<List<LikeItem>> search(String query) async {
    try {
      final allitems = likeBox.values.toList();

      final items =
          allitems.where((item) => item.recipe.contains(query)).toList();
      return items;
    } catch (e) {
      print('검색 실패: $e');
      throw e;
    }
  }


  @override
  List<LikeItem> loadItem(LikeItem item) {
   final items = Hive.box<LikeItem>('likebox').values.toList().cast<LikeItem>();
   return items;
  }
}
