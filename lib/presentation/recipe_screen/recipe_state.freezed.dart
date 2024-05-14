// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeState _$RecipeStateFromJson(Map<String, dynamic> json) {
  return _RecipeState.fromJson(json);
}

/// @nodoc
mixin _$RecipeState {
  List<String> get recipe => throw _privateConstructorUsedError;
  List<String> get url => throw _privateConstructorUsedError;
  List<bool> get isLike => throw _privateConstructorUsedError;
  String get foodName => throw _privateConstructorUsedError;
  List<int> get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeStateCopyWith<RecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStateCopyWith<$Res> {
  factory $RecipeStateCopyWith(
          RecipeState value, $Res Function(RecipeState) then) =
      _$RecipeStateCopyWithImpl<$Res, RecipeState>;
  @useResult
  $Res call(
      {List<String> recipe,
      List<String> url,
      List<bool> isLike,
      String foodName,
      List<int> id});
}

/// @nodoc
class _$RecipeStateCopyWithImpl<$Res, $Val extends RecipeState>
    implements $RecipeStateCopyWith<$Res> {
  _$RecipeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
    Object? url = null,
    Object? isLike = null,
    Object? foodName = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeStateImplCopyWith<$Res>
    implements $RecipeStateCopyWith<$Res> {
  factory _$$RecipeStateImplCopyWith(
          _$RecipeStateImpl value, $Res Function(_$RecipeStateImpl) then) =
      __$$RecipeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> recipe,
      List<String> url,
      List<bool> isLike,
      String foodName,
      List<int> id});
}

/// @nodoc
class __$$RecipeStateImplCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$RecipeStateImpl>
    implements _$$RecipeStateImplCopyWith<$Res> {
  __$$RecipeStateImplCopyWithImpl(
      _$RecipeStateImpl _value, $Res Function(_$RecipeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
    Object? url = null,
    Object? isLike = null,
    Object? foodName = null,
    Object? id = null,
  }) {
    return _then(_$RecipeStateImpl(
      recipe: null == recipe
          ? _value._recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value._url
          : url // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLike: null == isLike
          ? _value._isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeStateImpl implements _RecipeState {
  const _$RecipeStateImpl(
      {final List<String> recipe = const [],
      final List<String> url = const [],
      final List<bool> isLike = const [],
      this.foodName = '',
      final List<int> id = const []})
      : _recipe = recipe,
        _url = url,
        _isLike = isLike,
        _id = id;

  factory _$RecipeStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeStateImplFromJson(json);

  final List<String> _recipe;
  @override
  @JsonKey()
  List<String> get recipe {
    if (_recipe is EqualUnmodifiableListView) return _recipe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipe);
  }

  final List<String> _url;
  @override
  @JsonKey()
  List<String> get url {
    if (_url is EqualUnmodifiableListView) return _url;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_url);
  }

  final List<bool> _isLike;
  @override
  @JsonKey()
  List<bool> get isLike {
    if (_isLike is EqualUnmodifiableListView) return _isLike;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isLike);
  }

  @override
  @JsonKey()
  final String foodName;
  final List<int> _id;
  @override
  @JsonKey()
  List<int> get id {
    if (_id is EqualUnmodifiableListView) return _id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_id);
  }

  @override
  String toString() {
    return 'RecipeState(recipe: $recipe, url: $url, isLike: $isLike, foodName: $foodName, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeStateImpl &&
            const DeepCollectionEquality().equals(other._recipe, _recipe) &&
            const DeepCollectionEquality().equals(other._url, _url) &&
            const DeepCollectionEquality().equals(other._isLike, _isLike) &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName) &&
            const DeepCollectionEquality().equals(other._id, _id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recipe),
      const DeepCollectionEquality().hash(_url),
      const DeepCollectionEquality().hash(_isLike),
      foodName,
      const DeepCollectionEquality().hash(_id));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeStateImplCopyWith<_$RecipeStateImpl> get copyWith =>
      __$$RecipeStateImplCopyWithImpl<_$RecipeStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeStateImplToJson(
      this,
    );
  }
}

abstract class _RecipeState implements RecipeState {
  const factory _RecipeState(
      {final List<String> recipe,
      final List<String> url,
      final List<bool> isLike,
      final String foodName,
      final List<int> id}) = _$RecipeStateImpl;

  factory _RecipeState.fromJson(Map<String, dynamic> json) =
      _$RecipeStateImpl.fromJson;

  @override
  List<String> get recipe;
  @override
  List<String> get url;
  @override
  List<bool> get isLike;
  @override
  String get foodName;
  @override
  List<int> get id;
  @override
  @JsonKey(ignore: true)
  _$$RecipeStateImplCopyWith<_$RecipeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
