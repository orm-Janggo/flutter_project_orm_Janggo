import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_history_detail_state.freezed.dart';

part 'recipe_history_detail_state.g.dart';

@freezed
class RecipeHistoryDetailState with _$RecipeHistoryDetailState {
  const factory RecipeHistoryDetailState(
      {@Default(0) int id,
      @Default('') String recipe,
      @Default('') String url}) = _RecipeHistoryDetailState;

  factory RecipeHistoryDetailState.fromJson(Map<String, Object?> json) =>
      _$RecipeHistoryDetailStateFromJson(json);
}
