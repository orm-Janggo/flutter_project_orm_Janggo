import 'package:hive/hive.dart';

import 'like_item.dart';

class LikeBox {
  static const String _boxName = 'likebox';

  Future<void> addLikeItem(LikeItem item) async {
    final likebox = await Hive.openBox<LikeItem>(_boxName);
    await likebox.add(item);
  }

  Future<List<LikeItem>> getLikeItems() async {
    final likebox = await Hive.openBox<LikeItem>(_boxName);
    return likebox.values.map((dynamic item) => item as LikeItem).toList();
  }

  Future<void> removeLikeItem(int index) async {
    final likebox = await Hive.openBox<LikeItem>(_boxName);
    if (index >= 0 && index < likebox.length) {
      await likebox.deleteAt(index);
    }
  }
}
