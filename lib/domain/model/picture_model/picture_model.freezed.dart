// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PictureModel _$PictureModelFromJson(Map<String, dynamic> json) {
  return _PictureModel.fromJson(json);
}

/// @nodoc
mixin _$PictureModel {
  int get id => throw _privateConstructorUsedError;

  String get url => throw _privateConstructorUsedError;

  String get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureModelCopyWith<PictureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureModelCopyWith<$Res> {
  factory $PictureModelCopyWith(
          PictureModel value, $Res Function(PictureModel) then) =
      _$PictureModelCopyWithImpl<$Res, PictureModel>;

  @useResult
  $Res call({int id, String url, String tags});
}

/// @nodoc
class _$PictureModelCopyWithImpl<$Res, $Val extends PictureModel>
    implements $PictureModelCopyWith<$Res> {
  _$PictureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureModelImplCopyWith<$Res>
    implements $PictureModelCopyWith<$Res> {
  factory _$$PictureModelImplCopyWith(
          _$PictureModelImpl value, $Res Function(_$PictureModelImpl) then) =
      __$$PictureModelImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({int id, String url, String tags});
}

/// @nodoc
class __$$PictureModelImplCopyWithImpl<$Res>
    extends _$PictureModelCopyWithImpl<$Res, _$PictureModelImpl>
    implements _$$PictureModelImplCopyWith<$Res> {
  __$$PictureModelImplCopyWithImpl(
      _$PictureModelImpl _value, $Res Function(_$PictureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? tags = null,
  }) {
    return _then(_$PictureModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PictureModelImpl implements _PictureModel {
  const _$PictureModelImpl(
      {required this.id, required this.url, required this.tags});

  factory _$PictureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PictureModelImplFromJson(json);

  @override
  final int id;
  @override
  final String url;
  @override
  final String tags;

  @override
  String toString() {
    return 'PictureModel(id: $id, url: $url, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.tags, tags) || other.tags == tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, tags);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureModelImplCopyWith<_$PictureModelImpl> get copyWith =>
      __$$PictureModelImplCopyWithImpl<_$PictureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PictureModelImplToJson(
      this,
    );
  }
}

abstract class _PictureModel implements PictureModel {
  const factory _PictureModel(
      {required final int id,
      required final String url,
      required final String tags}) = _$PictureModelImpl;

  factory _PictureModel.fromJson(Map<String, dynamic> json) =
      _$PictureModelImpl.fromJson;

  @override
  int get id;

  @override
  String get url;

  @override
  String get tags;

  @override
  @JsonKey(ignore: true)
  _$$PictureModelImplCopyWith<_$PictureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
