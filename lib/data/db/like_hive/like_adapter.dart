import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'like_item.dart';

class LikeBoxAdapter {
  late Box<LikeItem> likeBox;

  Future<void> initialize() async {
    final appDocDirectoryPath = await getApplicationDocumentsDirectory();
    Hive.init(appDocDirectoryPath.path);
    Hive.registerAdapter<LikeItem>(LikeItemAdapter());
    likeBox = await Hive.openBox<LikeItem>('likeBox');
  }

  Future<void> addItem(LikeItem item) async {
    try {
      await likeBox.add(item);
    } catch (e) {
      print('Failed to add item: $e');
    }
  }

  Future<void> removeItem(int index) async {
    try {
      await likeBox.deleteAt(index);
    } catch (e) {
      print('Failed to remove item at index $index: $e');
    }
  }

  List<LikeItem> getItems() {
    return likeBox.values.toList();
  }

  Future<void> dispose() async {
    try {
      await likeBox.close();
      await Hive.close();
    } catch (e) {
      print('Failed to dispose: $e');
    }
  }
}
