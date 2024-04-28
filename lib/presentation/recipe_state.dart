import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_state.freezed.dart';

part 'recipe_state.g.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState({
    @Default('') String recipe
  }) = _RecipeState;
  
  factory RecipeState.fromJson(Map<String, Object?> json) => _$RecipeStateFromJson(json); 
}