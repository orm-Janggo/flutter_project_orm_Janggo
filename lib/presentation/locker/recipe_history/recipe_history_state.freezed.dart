// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeHistoryState _$RecipeHistoryStateFromJson(Map<String, dynamic> json) {
  return _RecipeHistoryState.fromJson(json);
}

/// @nodoc
mixin _$RecipeHistoryState {
  List<int> get id => throw _privateConstructorUsedError;
  List<String> get recipe => throw _privateConstructorUsedError;
  List<String> get url => throw _privateConstructorUsedError;
  List<String> get searchDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeHistoryStateCopyWith<RecipeHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeHistoryStateCopyWith<$Res> {
  factory $RecipeHistoryStateCopyWith(
          RecipeHistoryState value, $Res Function(RecipeHistoryState) then) =
      _$RecipeHistoryStateCopyWithImpl<$Res, RecipeHistoryState>;
  @useResult
  $Res call(
      {List<int> id,
      List<String> recipe,
      List<String> url,
      List<String> searchDate});
}

/// @nodoc
class _$RecipeHistoryStateCopyWithImpl<$Res, $Val extends RecipeHistoryState>
    implements $RecipeHistoryStateCopyWith<$Res> {
  _$RecipeHistoryStateCopyWithImpl(this._value, this._then);

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
    Object? searchDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchDate: null == searchDate
          ? _value.searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeHistoryStateImplCopyWith<$Res>
    implements $RecipeHistoryStateCopyWith<$Res> {
  factory _$$RecipeHistoryStateImplCopyWith(_$RecipeHistoryStateImpl value,
          $Res Function(_$RecipeHistoryStateImpl) then) =
      __$$RecipeHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> id,
      List<String> recipe,
      List<String> url,
      List<String> searchDate});
}

/// @nodoc
class __$$RecipeHistoryStateImplCopyWithImpl<$Res>
    extends _$RecipeHistoryStateCopyWithImpl<$Res, _$RecipeHistoryStateImpl>
    implements _$$RecipeHistoryStateImplCopyWith<$Res> {
  __$$RecipeHistoryStateImplCopyWithImpl(_$RecipeHistoryStateImpl _value,
      $Res Function(_$RecipeHistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipe = null,
    Object? url = null,
    Object? searchDate = null,
  }) {
    return _then(_$RecipeHistoryStateImpl(
      id: null == id
          ? _value._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>,
      recipe: null == recipe
          ? _value._recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value._url
          : url // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchDate: null == searchDate
          ? _value._searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeHistoryStateImpl implements _RecipeHistoryState {
  const _$RecipeHistoryStateImpl(
      {final List<int> id = const [],
      final List<String> recipe = const [],
      final List<String> url = const [],
      final List<String> searchDate = const []})
      : _id = id,
        _recipe = recipe,
        _url = url,
        _searchDate = searchDate;

  factory _$RecipeHistoryStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeHistoryStateImplFromJson(json);

  final List<int> _id;
  @override
  @JsonKey()
  List<int> get id {
    if (_id is EqualUnmodifiableListView) return _id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_id);
  }

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

  final List<String> _searchDate;
  @override
  @JsonKey()
  List<String> get searchDate {
    if (_searchDate is EqualUnmodifiableListView) return _searchDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchDate);
  }

  @override
  String toString() {
    return 'RecipeHistoryState(id: $id, recipe: $recipe, url: $url, searchDate: $searchDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeHistoryStateImpl &&
            const DeepCollectionEquality().equals(other._id, _id) &&
            const DeepCollectionEquality().equals(other._recipe, _recipe) &&
            const DeepCollectionEquality().equals(other._url, _url) &&
            const DeepCollectionEquality()
                .equals(other._searchDate, _searchDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_id),
      const DeepCollectionEquality().hash(_recipe),
      const DeepCollectionEquality().hash(_url),
      const DeepCollectionEquality().hash(_searchDate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeHistoryStateImplCopyWith<_$RecipeHistoryStateImpl> get copyWith =>
      __$$RecipeHistoryStateImplCopyWithImpl<_$RecipeHistoryStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeHistoryStateImplToJson(
      this,
    );
  }
}

abstract class _RecipeHistoryState implements RecipeHistoryState {
  const factory _RecipeHistoryState(
      {final List<int> id,
      final List<String> recipe,
      final List<String> url,
      final List<String> searchDate}) = _$RecipeHistoryStateImpl;

  factory _RecipeHistoryState.fromJson(Map<String, dynamic> json) =
      _$RecipeHistoryStateImpl.fromJson;

  @override
  List<int> get id;
  @override
  List<String> get recipe;
  @override
  List<String> get url;
  @override
  List<String> get searchDate;
  @override
  @JsonKey(ignore: true)
  _$$RecipeHistoryStateImplCopyWith<_$RecipeHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
