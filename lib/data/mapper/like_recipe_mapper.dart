import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';
import 'package:flutter_project_orm_janggo/domain/model/like_model.dart';

extension ToLikeModel on LikeItem {
  LikeModel toLikeModel() {
    return LikeModel(
      recipe: recipe,
      id: id,
      imageUrl: imageUrl,
      isLiked: isLiked,
      foodName: foodName,
      time: time,
    );
  }
}

extension ToLike on LikeModel {
  LikeItem toLike() {
    return LikeItem(
      recipe: recipe,
      id: id,
      imageUrl: imageUrl,
      isLiked: isLiked,
      foodName: foodName,
      time: time,
    );
  }
}
