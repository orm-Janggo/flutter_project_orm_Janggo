import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_model.freezed.dart';

part 'like_model.g.dart';

@freezed
class LikeModel with _$LikeModel {
  const factory LikeModel({
    required String recipe,
    required String id,
    required String imageUrl,
    required bool isLiked,
    required String foodName,
    required DateTime time,
  }) = _LikeModel;

  factory LikeModel.fromJson(Map<String, Object?> json) => _$LikeModelFromJson(json);
}