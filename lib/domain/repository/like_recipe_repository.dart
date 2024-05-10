import '../../data/db/like_hive/like_item.dart';

abstract interface class LikeRecipeRepository {
  Future<void> addItem(LikeItem item);

  Future<void> removeItem(LikeItem item);

  Future<List<LikeItem>> search(String query);

  List<LikeItem> loadItem(LikeItem item);
}
