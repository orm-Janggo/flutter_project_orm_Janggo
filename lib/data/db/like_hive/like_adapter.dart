import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'like_item.dart';

class LikeBoxAdapter extends TypeAdapter<LikeItem> {
  @override
  LikeItem read(BinaryReader reader) {
    return LikeItem(
        recipe: reader.readString(),
        id: reader.readString(),
        imageUrl: reader.readString(),
        isLiked: reader.readBool(),
        foodName: reader.readString()
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, LikeItem obj) {
    writer.writeString(obj.recipe);
    writer.writeString(obj.id);
    writer.writeString(obj.imageUrl);
    writer.writeString(obj.foodName);
    writer.writeBool(obj.isLiked);
  }

//   late Box<LikeItem> likeBox;
// // 데이터 담을 준비
//   Future<void> initialize() async {
//     final appDocDirectoryPath = await getApplicationDocumentsDirectory();
//     Hive.init(appDocDirectoryPath.path);
//     Hive.registerAdapter<LikeItem>(LikeItemAdapter());
//     likeBox = await Hive.openBox<LikeItem>('likeBox');
//   }
//
//   Future<void> addItem(LikeItem item) async {
//     try {
//       await likeBox.add(item);
//     } catch (e) {
//       print('아이템 추가 실패: $e');
//     }
//   }
//
//   Future<void> removeItem(int index) async {
//     try {
//       await likeBox.deleteAt(index);
//     } catch (e) {
//       print('아이템 삭제 실패 $index: $e');
//     }
//   }
//
//   Future<List<LikeItem>> getItems() async {
//     return likeBox.values.toList();
//   }
//
//   Future<void> dispose() async {
//     try {
//       await likeBox.close();
//       await Hive.close();
//     } catch (e) {
//       print('dispose 실패: $e');
//     }
//   }
}
