// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_history_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeHistoryStateImpl _$$RecipeHistoryStateImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeHistoryStateImpl(
      id: (json['id'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      recipe: (json['recipe'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      url: (json['url'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$RecipeHistoryStateImplToJson(
        _$RecipeHistoryStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipe': instance.recipe,
      'url': instance.url,
    };
