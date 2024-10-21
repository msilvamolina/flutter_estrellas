// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_lite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductLiteModel _$ProductLiteModelFromJson(Map<String, dynamic> json) {
  return _ProductLiteModel.fromJson(json);
}

/// @nodoc
mixin _$ProductLiteModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get externalId => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  double? get suggestedPrice => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isPercentage => throw _privateConstructorUsedError;
  bool? get showInFeed => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductLiteModelCopyWith<ProductLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductLiteModelCopyWith<$Res> {
  factory $ProductLiteModelCopyWith(
          ProductLiteModel value, $Res Function(ProductLiteModel) then) =
      _$ProductLiteModelCopyWithImpl<$Res, ProductLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? provider,
      String? name,
      String? externalId,
      double? price,
      int? points,
      double? suggestedPrice,
      String? type,
      bool? isPercentage,
      bool? showInFeed,
      bool? active,
      String? thumbnail,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$ProductLiteModelCopyWithImpl<$Res, $Val extends ProductLiteModel>
    implements $ProductLiteModelCopyWith<$Res> {
  _$ProductLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? provider = freezed,
    Object? name = freezed,
    Object? externalId = freezed,
    Object? price = freezed,
    Object? points = freezed,
    Object? suggestedPrice = freezed,
    Object? type = freezed,
    Object? isPercentage = freezed,
    Object? showInFeed = freezed,
    Object? active = freezed,
    Object? thumbnail = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      suggestedPrice: freezed == suggestedPrice
          ? _value.suggestedPrice
          : suggestedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isPercentage: freezed == isPercentage
          ? _value.isPercentage
          : isPercentage // ignore: cast_nullable_to_non_nullable
              as bool?,
      showInFeed: freezed == showInFeed
          ? _value.showInFeed
          : showInFeed // ignore: cast_nullable_to_non_nullable
              as bool?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductLiteModelImplCopyWith<$Res>
    implements $ProductLiteModelCopyWith<$Res> {
  factory _$$ProductLiteModelImplCopyWith(_$ProductLiteModelImpl value,
          $Res Function(_$ProductLiteModelImpl) then) =
      __$$ProductLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? provider,
      String? name,
      String? externalId,
      double? price,
      int? points,
      double? suggestedPrice,
      String? type,
      bool? isPercentage,
      bool? showInFeed,
      bool? active,
      String? thumbnail,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$ProductLiteModelImplCopyWithImpl<$Res>
    extends _$ProductLiteModelCopyWithImpl<$Res, _$ProductLiteModelImpl>
    implements _$$ProductLiteModelImplCopyWith<$Res> {
  __$$ProductLiteModelImplCopyWithImpl(_$ProductLiteModelImpl _value,
      $Res Function(_$ProductLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? provider = freezed,
    Object? name = freezed,
    Object? externalId = freezed,
    Object? price = freezed,
    Object? points = freezed,
    Object? suggestedPrice = freezed,
    Object? type = freezed,
    Object? isPercentage = freezed,
    Object? showInFeed = freezed,
    Object? active = freezed,
    Object? thumbnail = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProductLiteModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      suggestedPrice: freezed == suggestedPrice
          ? _value.suggestedPrice
          : suggestedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isPercentage: freezed == isPercentage
          ? _value.isPercentage
          : isPercentage // ignore: cast_nullable_to_non_nullable
              as bool?,
      showInFeed: freezed == showInFeed
          ? _value.showInFeed
          : showInFeed // ignore: cast_nullable_to_non_nullable
              as bool?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductLiteModelImpl extends _ProductLiteModel {
  const _$ProductLiteModelImpl(
      {@JsonKey(name: '_id') required this.id,
      this.provider,
      this.name,
      this.externalId,
      this.price,
      this.points,
      this.suggestedPrice,
      this.type,
      this.isPercentage,
      this.showInFeed,
      this.active,
      this.thumbnail,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$ProductLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductLiteModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? provider;
  @override
  final String? name;
  @override
  final String? externalId;
  @override
  final double? price;
  @override
  final int? points;
  @override
  final double? suggestedPrice;
  @override
  final String? type;
  @override
  final bool? isPercentage;
  @override
  final bool? showInFeed;
  @override
  final bool? active;
  @override
  final String? thumbnail;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'ProductLiteModel(id: $id, provider: $provider, name: $name, externalId: $externalId, price: $price, points: $points, suggestedPrice: $suggestedPrice, type: $type, isPercentage: $isPercentage, showInFeed: $showInFeed, active: $active, thumbnail: $thumbnail, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductLiteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.suggestedPrice, suggestedPrice) ||
                other.suggestedPrice == suggestedPrice) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isPercentage, isPercentage) ||
                other.isPercentage == isPercentage) &&
            (identical(other.showInFeed, showInFeed) ||
                other.showInFeed == showInFeed) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      provider,
      name,
      externalId,
      price,
      points,
      suggestedPrice,
      type,
      isPercentage,
      showInFeed,
      active,
      thumbnail,
      createdAt,
      updatedAt);

  /// Create a copy of ProductLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductLiteModelImplCopyWith<_$ProductLiteModelImpl> get copyWith =>
      __$$ProductLiteModelImplCopyWithImpl<_$ProductLiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductLiteModelImplToJson(
      this,
    );
  }
}

abstract class _ProductLiteModel extends ProductLiteModel {
  const factory _ProductLiteModel(
      {@JsonKey(name: '_id') required final String id,
      final String? provider,
      final String? name,
      final String? externalId,
      final double? price,
      final int? points,
      final double? suggestedPrice,
      final String? type,
      final bool? isPercentage,
      final bool? showInFeed,
      final bool? active,
      final String? thumbnail,
      final String? createdAt,
      final String? updatedAt}) = _$ProductLiteModelImpl;
  const _ProductLiteModel._() : super._();

  factory _ProductLiteModel.fromJson(Map<String, dynamic> json) =
      _$ProductLiteModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get provider;
  @override
  String? get name;
  @override
  String? get externalId;
  @override
  double? get price;
  @override
  int? get points;
  @override
  double? get suggestedPrice;
  @override
  String? get type;
  @override
  bool? get isPercentage;
  @override
  bool? get showInFeed;
  @override
  bool? get active;
  @override
  String? get thumbnail;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of ProductLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductLiteModelImplCopyWith<_$ProductLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
