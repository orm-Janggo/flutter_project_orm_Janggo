// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_history_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeHistoryDetailState _$RecipeHistoryDetailStateFromJson(
    Map<String, dynamic> json) {
  return _RecipeHistoryDetailState.fromJson(json);
}

/// @nodoc
mixin _$RecipeHistoryDetailState {
  int get id => throw _privateConstructorUsedError;
  String get recipe => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeHistoryDetailStateCopyWith<RecipeHistoryDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeHistoryDetailStateCopyWith<$Res> {
  factory $RecipeHistoryDetailStateCopyWith(RecipeHistoryDetailState value,
          $Res Function(RecipeHistoryDetailState) then) =
      _$RecipeHistoryDetailStateCopyWithImpl<$Res, RecipeHistoryDetailState>;
  @useResult
  $Res call({int id, String recipe, String url});
}

/// @nodoc
class _$RecipeHistoryDetailStateCopyWithImpl<$Res,
        $Val extends RecipeHistoryDetailState>
    implements $RecipeHistoryDetailStateCopyWith<$Res> {
  _$RecipeHistoryDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipe = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeHistoryDetailStateImplCopyWith<$Res>
    implements $RecipeHistoryDetailStateCopyWith<$Res> {
  factory _$$RecipeHistoryDetailStateImplCopyWith(
          _$RecipeHistoryDetailStateImpl value,
          $Res Function(_$RecipeHistoryDetailStateImpl) then) =
      __$$RecipeHistoryDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String recipe, String url});
}

/// @nodoc
class __$$RecipeHistoryDetailStateImplCopyWithImpl<$Res>
    extends _$RecipeHistoryDetailStateCopyWithImpl<$Res,
        _$RecipeHistoryDetailStateImpl>
    implements _$$RecipeHistoryDetailStateImplCopyWith<$Res> {
  __$$RecipeHistoryDetailStateImplCopyWithImpl(
      _$RecipeHistoryDetailStateImpl _value,
      $Res Function(_$RecipeHistoryDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipe = null,
    Object? url = null,
  }) {
    return _then(_$RecipeHistoryDetailStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeHistoryDetailStateImpl implements _RecipeHistoryDetailState {
  const _$RecipeHistoryDetailStateImpl(
      {this.id = 0, this.recipe = '', this.url = ''});

  factory _$RecipeHistoryDetailStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeHistoryDetailStateImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String recipe;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'RecipeHistoryDetailState(id: $id, recipe: $recipe, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeHistoryDetailStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, recipe, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeHistoryDetailStateImplCopyWith<_$RecipeHistoryDetailStateImpl>
      get copyWith => __$$RecipeHistoryDetailStateImplCopyWithImpl<
          _$RecipeHistoryDetailStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeHistoryDetailStateImplToJson(
      this,
    );
  }
}

abstract class _RecipeHistoryDetailState implements RecipeHistoryDetailState {
  const factory _RecipeHistoryDetailState(
      {final int id,
      final String recipe,
      final String url}) = _$RecipeHistoryDetailStateImpl;

  factory _RecipeHistoryDetailState.fromJson(Map<String, dynamic> json) =
      _$RecipeHistoryDetailStateImpl.fromJson;

  @override
  int get id;
  @override
  String get recipe;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$RecipeHistoryDetailStateImplCopyWith<_$RecipeHistoryDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
