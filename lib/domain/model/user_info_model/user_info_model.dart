import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';

part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    required String displayName,
    required String email,
    required String uid,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, Object?> json) => _$UserInfoModelFromJson(json);
}