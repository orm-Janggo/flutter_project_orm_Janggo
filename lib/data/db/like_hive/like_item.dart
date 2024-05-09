import 'package:hive/hive.dart';


class LikeItem  {
  late String recipe;

  late String id;

  late String imageUrl;

  late bool isLiked;


  @override
  String toString() {
    return 'LikeItem{recipe: $recipe, id: $id, imageUrl: $imageUrl, isLiked: $isLiked}';
  }

  LikeItem({
    required this.recipe,
    required this.id,
    required this.imageUrl,
    required this.isLiked,
  });

  Map<String, dynamic> toMap() {
    return {
      'recipe': this.recipe,
      'id': this.id,
      'imageUrl': this.imageUrl,
      'isLiked': this.isLiked,
    };
  }

  factory LikeItem.fromMap(Map<String, dynamic> map) {
    return LikeItem(
      recipe: map['recipe'] as String,
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      isLiked: map['isLiked'] as bool,
    );
  }
}
