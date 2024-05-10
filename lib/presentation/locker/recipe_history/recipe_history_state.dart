import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_history_state.freezed.dart';

part 'recipe_history_state.g.dart';

@freezed
class RecipeHistoryState with _$RecipeHistoryState {
  const factory RecipeHistoryState(
      {@Default([]) List<int> id,
      @Default([]) List<String> recipe,
      @Default([]) List<String> url}) = _RecipeHistoryState;

  factory RecipeHistoryState.fromJson(Map<String, Object?> json) =>
      _$RecipeHistoryStateFromJson(json);
}