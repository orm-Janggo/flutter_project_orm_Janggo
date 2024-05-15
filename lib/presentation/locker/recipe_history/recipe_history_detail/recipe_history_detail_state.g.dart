// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_history_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeHistoryDetailStateImpl _$$RecipeHistoryDetailStateImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeHistoryDetailStateImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      recipe: json['recipe'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$RecipeHistoryDetailStateImplToJson(
        _$RecipeHistoryDetailStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipe': instance.recipe,
      'url': instance.url,
    };
