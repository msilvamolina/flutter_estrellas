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
  String get thumbnail => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  String? get productId => throw _privateConstructorUsedError;
  ProductFirebaseLiteModel? get product => throw _privateConstructorUsedError;
  String? get searchField => throw _privateConstructorUsedError;
  dynamic get reference => throw _privateConstructorUsedError;

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
      String thumbnail,
      String videoUrl,
      int? likes,
      String? productId,
      ProductFirebaseLiteModel? product,
      String? searchField,
      dynamic reference});

  $ProductFirebaseLiteModelCopyWith<$Res>? get product;
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
    Object? thumbnail = null,
    Object? videoUrl = null,
    Object? likes = freezed,
    Object? productId = freezed,
    Object? product = freezed,
    Object? searchField = freezed,
    Object? reference = freezed,
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
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductFirebaseLiteModel?,
      searchField: freezed == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of VideoPostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductFirebaseLiteModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductFirebaseLiteModelCopyWith<$Res>(_value.product!, (value) {
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
      String thumbnail,
      String videoUrl,
      int? likes,
      String? productId,
      ProductFirebaseLiteModel? product,
      String? searchField,
      dynamic reference});

  @override
  $ProductFirebaseLiteModelCopyWith<$Res>? get product;
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
    Object? thumbnail = null,
    Object? videoUrl = null,
    Object? likes = freezed,
    Object? productId = freezed,
    Object? product = freezed,
    Object? searchField = freezed,
    Object? reference = freezed,
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
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductFirebaseLiteModel?,
      searchField: freezed == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoPostModelImpl extends _VideoPostModel {
  const _$VideoPostModelImpl(
      {required this.name,
      required this.id,
      required this.thumbnail,
      required this.videoUrl,
      this.likes,
      this.productId,
      this.product,
      this.searchField,
      this.reference})
      : super._();

  factory _$VideoPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoPostModelImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String thumbnail;
  @override
  final String videoUrl;
  @override
  final int? likes;
  @override
  final String? productId;
  @override
  final ProductFirebaseLiteModel? product;
  @override
  final String? searchField;
  @override
  final dynamic reference;

  @override
  String toString() {
    return 'VideoPostModel(name: $name, id: $id, thumbnail: $thumbnail, videoUrl: $videoUrl, likes: $likes, productId: $productId, product: $product, searchField: $searchField, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoPostModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.searchField, searchField) ||
                other.searchField == searchField) &&
            const DeepCollectionEquality().equals(other.reference, reference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      id,
      thumbnail,
      videoUrl,
      likes,
      productId,
      product,
      searchField,
      const DeepCollectionEquality().hash(reference));

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
      required final String thumbnail,
      required final String videoUrl,
      final int? likes,
      final String? productId,
      final ProductFirebaseLiteModel? product,
      final String? searchField,
      final dynamic reference}) = _$VideoPostModelImpl;
  const _VideoPostModel._() : super._();

  factory _VideoPostModel.fromJson(Map<String, dynamic> json) =
      _$VideoPostModelImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  String get thumbnail;
  @override
  String get videoUrl;
  @override
  int? get likes;
  @override
  String? get productId;
  @override
  ProductFirebaseLiteModel? get product;
  @override
  String? get searchField;
  @override
  dynamic get reference;

  /// Create a copy of VideoPostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoPostModelImplCopyWith<_$VideoPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
