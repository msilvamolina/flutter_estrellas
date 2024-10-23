// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoPostModel _$VideoPostModelFromJson(Map<String, dynamic> json) {
  return _VideoPostModel.fromJson(json);
}

/// @nodoc
mixin _$VideoPostModel {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  String get createdByEmail => throw _privateConstructorUsedError;
  String get createdById => throw _privateConstructorUsedError;
  ProductLiteModel? get product => throw _privateConstructorUsedError;
  String? get searchField => throw _privateConstructorUsedError;
  dynamic get reference => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this VideoPostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoPostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoPostModelCopyWith<VideoPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPostModelCopyWith<$Res> {
  factory $VideoPostModelCopyWith(
          VideoPostModel value, $Res Function(VideoPostModel) then) =
      _$VideoPostModelCopyWithImpl<$Res, VideoPostModel>;
  @useResult
  $Res call(
      {String name,
      String id,
      String createdAt,
      String thumbnail,
      String videoUrl,
      String createdByEmail,
      String createdById,
      ProductLiteModel? product,
      String? searchField,
      dynamic reference,
      String? updatedAt});

  $ProductLiteModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$VideoPostModelCopyWithImpl<$Res, $Val extends VideoPostModel>
    implements $VideoPostModelCopyWith<$Res> {
  _$VideoPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoPostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? createdAt = null,
    Object? thumbnail = null,
    Object? videoUrl = null,
    Object? createdByEmail = null,
    Object? createdById = null,
    Object? product = freezed,
    Object? searchField = freezed,
    Object? reference = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdByEmail: null == createdByEmail
          ? _value.createdByEmail
          : createdByEmail // ignore: cast_nullable_to_non_nullable
              as String,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as String,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductLiteModel?,
      searchField: freezed == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of VideoPostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductLiteModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductLiteModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VideoPostModelImplCopyWith<$Res>
    implements $VideoPostModelCopyWith<$Res> {
  factory _$$VideoPostModelImplCopyWith(_$VideoPostModelImpl value,
          $Res Function(_$VideoPostModelImpl) then) =
      __$$VideoPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String id,
      String createdAt,
      String thumbnail,
      String videoUrl,
      String createdByEmail,
      String createdById,
      ProductLiteModel? product,
      String? searchField,
      dynamic reference,
      String? updatedAt});

  @override
  $ProductLiteModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$VideoPostModelImplCopyWithImpl<$Res>
    extends _$VideoPostModelCopyWithImpl<$Res, _$VideoPostModelImpl>
    implements _$$VideoPostModelImplCopyWith<$Res> {
  __$$VideoPostModelImplCopyWithImpl(
      _$VideoPostModelImpl _value, $Res Function(_$VideoPostModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoPostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? createdAt = null,
    Object? thumbnail = null,
    Object? videoUrl = null,
    Object? createdByEmail = null,
    Object? createdById = null,
    Object? product = freezed,
    Object? searchField = freezed,
    Object? reference = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$VideoPostModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdByEmail: null == createdByEmail
          ? _value.createdByEmail
          : createdByEmail // ignore: cast_nullable_to_non_nullable
              as String,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as String,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductLiteModel?,
      searchField: freezed == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoPostModelImpl extends _VideoPostModel {
  const _$VideoPostModelImpl(
      {required this.name,
      required this.id,
      required this.createdAt,
      required this.thumbnail,
      required this.videoUrl,
      required this.createdByEmail,
      required this.createdById,
      this.product,
      this.searchField,
      this.reference,
      this.updatedAt})
      : super._();

  factory _$VideoPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoPostModelImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String thumbnail;
  @override
  final String videoUrl;
  @override
  final String createdByEmail;
  @override
  final String createdById;
  @override
  final ProductLiteModel? product;
  @override
  final String? searchField;
  @override
  final dynamic reference;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'VideoPostModel(name: $name, id: $id, createdAt: $createdAt, thumbnail: $thumbnail, videoUrl: $videoUrl, createdByEmail: $createdByEmail, createdById: $createdById, product: $product, searchField: $searchField, reference: $reference, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoPostModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.createdByEmail, createdByEmail) ||
                other.createdByEmail == createdByEmail) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.searchField, searchField) ||
                other.searchField == searchField) &&
            const DeepCollectionEquality().equals(other.reference, reference) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      id,
      createdAt,
      thumbnail,
      videoUrl,
      createdByEmail,
      createdById,
      product,
      searchField,
      const DeepCollectionEquality().hash(reference),
      updatedAt);

  /// Create a copy of VideoPostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoPostModelImplCopyWith<_$VideoPostModelImpl> get copyWith =>
      __$$VideoPostModelImplCopyWithImpl<_$VideoPostModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoPostModelImplToJson(
      this,
    );
  }
}

abstract class _VideoPostModel extends VideoPostModel {
  const factory _VideoPostModel(
      {required final String name,
      required final String id,
      required final String createdAt,
      required final String thumbnail,
      required final String videoUrl,
      required final String createdByEmail,
      required final String createdById,
      final ProductLiteModel? product,
      final String? searchField,
      final dynamic reference,
      final String? updatedAt}) = _$VideoPostModelImpl;
  const _VideoPostModel._() : super._();

  factory _VideoPostModel.fromJson(Map<String, dynamic> json) =
      _$VideoPostModelImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get thumbnail;
  @override
  String get videoUrl;
  @override
  String get createdByEmail;
  @override
  String get createdById;
  @override
  ProductLiteModel? get product;
  @override
  String? get searchField;
  @override
  dynamic get reference;
  @override
  String? get updatedAt;

  /// Create a copy of VideoPostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoPostModelImplCopyWith<_$VideoPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
