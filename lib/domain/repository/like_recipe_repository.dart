import 'package:flutter_project_orm_janggo/domain/model/like_model.dart';

import '../../data/db/like_hive/like_item.dart';

abstract interface class LikeRecipeRepository {
  Future<void> addItem(LikeModel model);

  Future<void> removeItem(LikeItem item);

  Future<List<LikeItem>> search(String query);

  List<LikeItem> loadItem(LikeItem item);
}
