// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_catalog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserCatalogModel _$UserCatalogModelFromJson(Map<String, dynamic> json) {
  return _UserCatalogModel.fromJson(json);
}

/// @nodoc
mixin _$UserCatalogModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<VideoPostModel>? get videos => throw _privateConstructorUsedError;

  /// Serializes this UserCatalogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCatalogModelCopyWith<UserCatalogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCatalogModelCopyWith<$Res> {
  factory $UserCatalogModelCopyWith(
          UserCatalogModel value, $Res Function(UserCatalogModel) then) =
      _$UserCatalogModelCopyWithImpl<$Res, UserCatalogModel>;
  @useResult
  $Res call(
      {String id, String name, String? imageUrl, List<VideoPostModel>? videos});
}

/// @nodoc
class _$UserCatalogModelCopyWithImpl<$Res, $Val extends UserCatalogModel>
    implements $UserCatalogModelCopyWith<$Res> {
  _$UserCatalogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? videos = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoPostModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCatalogModelImplCopyWith<$Res>
    implements $UserCatalogModelCopyWith<$Res> {
  factory _$$UserCatalogModelImplCopyWith(_$UserCatalogModelImpl value,
          $Res Function(_$UserCatalogModelImpl) then) =
      __$$UserCatalogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String? imageUrl, List<VideoPostModel>? videos});
}

/// @nodoc
class __$$UserCatalogModelImplCopyWithImpl<$Res>
    extends _$UserCatalogModelCopyWithImpl<$Res, _$UserCatalogModelImpl>
    implements _$$UserCatalogModelImplCopyWith<$Res> {
  __$$UserCatalogModelImplCopyWithImpl(_$UserCatalogModelImpl _value,
      $Res Function(_$UserCatalogModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? videos = freezed,
  }) {
    return _then(_$UserCatalogModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoPostModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCatalogModelImpl extends _UserCatalogModel {
  const _$UserCatalogModelImpl(
      {required this.id,
      required this.name,
      this.imageUrl,
      final List<VideoPostModel>? videos})
      : _videos = videos,
        super._();

  factory _$UserCatalogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCatalogModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? imageUrl;
  final List<VideoPostModel>? _videos;
  @override
  List<VideoPostModel>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserCatalogModel(id: $id, name: $name, imageUrl: $imageUrl, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCatalogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl,
      const DeepCollectionEquality().hash(_videos));

  /// Create a copy of UserCatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCatalogModelImplCopyWith<_$UserCatalogModelImpl> get copyWith =>
      __$$UserCatalogModelImplCopyWithImpl<_$UserCatalogModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCatalogModelImplToJson(
      this,
    );
  }
}

abstract class _UserCatalogModel extends UserCatalogModel {
  const factory _UserCatalogModel(
      {required final String id,
      required final String name,
      final String? imageUrl,
      final List<VideoPostModel>? videos}) = _$UserCatalogModelImpl;
  const _UserCatalogModel._() : super._();

  factory _UserCatalogModel.fromJson(Map<String, dynamic> json) =
      _$UserCatalogModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get imageUrl;
  @override
  List<VideoPostModel>? get videos;

  /// Create a copy of UserCatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCatalogModelImplCopyWith<_$UserCatalogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
