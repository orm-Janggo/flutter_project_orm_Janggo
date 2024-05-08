import 'package:hive/hive.dart';

import 'like_item.dart';

class LikeBox{
  static String _boxName ='likebox';
  Future<void> addLikeItem(LikeItem item) async{
    final box = await Hive.openBox<LikeItem>(_boxName);
    await box.add(item);
  }

  Future<List<LikeItem>> getLikeItems() async{
    final likebox = await Hive.openBox<LikeItem>(_boxName);
    return likebox.values.toList();
  }
}