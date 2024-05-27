import 'dart:async';

import 'package:flutter_project_orm_janggo/data/mapper/like_recipe_mapper.dart';
import 'package:flutter_project_orm_janggo/domain/model/like_model.dart';
import 'package:hive/hive.dart';

import '../../domain/repository/like_recipe_repository.dart';
import '../../main.dart';
import '../db/like_hive/like_item.dart';

class LikeRecipeRepositoryImpl implements LikeRecipeRepository {
  @override
  Future<void> addItem(LikeModel model) async {
    try {
      LikeItem item = model.toLike();
      await likeBox.put(item.id, item);
      print('아이템 추가');
    } catch (e) {
      print('아이템 추가 실패: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeItem(LikeItem item) async {
    try {
      await likeBox.delete(item.id);
      print('아이템 삭제');
    } catch (e) {
      print('아이템 삭제 실패: $e');
      rethrow;
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
      rethrow;
    }
  }

  @override
  List<LikeItem> loadItem(LikeItem item) {
    final items =
        Hive.box<LikeItem>('likebox').values.toList().cast<LikeItem>();
    return items;
  }
}
