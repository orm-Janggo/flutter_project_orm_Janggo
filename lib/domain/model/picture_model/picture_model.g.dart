// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PictureModelImpl _$$PictureModelImplFromJson(Map<String, dynamic> json) =>
    _$PictureModelImpl(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      tags: json['tags'] as String,
    );

Map<String, dynamic> _$$PictureModelImplToJson(_$PictureModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'tags': instance.tags,
    };
