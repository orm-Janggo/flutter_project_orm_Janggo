import 'package:hive/hive.dart';

part 'like_item.g.dart';

@HiveType(typeId: 0)
class LikeItem extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String recipe;

  @HiveField(2)
  late String id;

  @HiveField(3)
  late String imageUrl;

  @HiveField(4)
  late bool isLiked;

  LikeItem(this.title, this.recipe, this.id, this.imageUrl, this.isLiked);
}
