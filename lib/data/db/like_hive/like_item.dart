import 'package:hive/hive.dart';

part 'like_item.g.dart';

@HiveType(typeId: 0)
class LikeItem extends HiveObject {
  @HiveField(0)
  late String recipe;

  @HiveField(1)
  late String id;

  @HiveField(2)
  late String imageUrl;

  @HiveField(3)
  late bool isLiked;



  LikeItem({
    required this.recipe,
    required this.id,
    required this.imageUrl,
    required this.isLiked,
  });
}
