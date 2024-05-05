import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

part 'sign_up_state.g.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(false) isSignUpSuccess,
  }) = _SignUpState;

  factory SignUpState.fromJson(Map<String, Object?> json) => _$SignUpStateFromJson(json);
}