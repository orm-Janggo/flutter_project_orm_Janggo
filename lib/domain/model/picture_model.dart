import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_model.freezed.dart';

part 'picture_model.g.dart';

@freezed
class PictureModel with _$PictureModel {
  const factory PictureModel({
    required int id,
    required String url,
    required String tags,
  }) = _PictureModel;

  factory PictureModel.fromJson(Map<String, Object?> json) =>
      _$PictureModelFromJson(json);
}
