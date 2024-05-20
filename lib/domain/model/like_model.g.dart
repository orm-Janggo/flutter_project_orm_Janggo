// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LikeModelImpl _$$LikeModelImplFromJson(Map<String, dynamic> json) =>
    _$LikeModelImpl(
      recipe: json['recipe'] as String,
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      isLiked: json['isLiked'] as bool,
      foodName: json['foodName'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$LikeModelImplToJson(_$LikeModelImpl instance) =>
    <String, dynamic>{
      'recipe': instance.recipe,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'isLiked': instance.isLiked,
      'foodName': instance.foodName,
      'time': instance.time.toIso8601String(),
    };
