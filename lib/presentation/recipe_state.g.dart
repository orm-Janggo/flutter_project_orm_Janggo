// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeStateImpl _$$RecipeStateImplFromJson(Map<String, dynamic> json) =>
    _$RecipeStateImpl(
      recipe: (json['recipe'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      url: (json['url'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$RecipeStateImplToJson(_$RecipeStateImpl instance) =>
    <String, dynamic>{
      'recipe': instance.recipe,
      'url': instance.url,
    };
