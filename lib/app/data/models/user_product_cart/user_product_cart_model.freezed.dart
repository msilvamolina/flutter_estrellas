// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_product_cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProductCartModel _$UserProductCartModelFromJson(Map<String, dynamic> json) {
  return _UserProductCartModel.fromJson(json);
}

/// @nodoc
mixin _$UserProductCartModel {
  String get id => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get createdByUserId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get suggestedPrice => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  VideoPostModel? get video => throw _privateConstructorUsedError;
  ProductVariantCombinationModel? get productCombination =>
      throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserProductCartModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProductCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProductCartModelCopyWith<UserProductCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProductCartModelCopyWith<$Res> {
  factory $UserProductCartModelCopyWith(UserProductCartModel value,
          $Res Function(UserProductCartModel) then) =
      _$UserProductCartModelCopyWithImpl<$Res, UserProductCartModel>;
  @useResult
  $Res call(
      {String id,
      String createdBy,
      String createdByUserId,
      double price,
      double suggestedPrice,
      int points,
      int stock,
      int? quantity,
      VideoPostModel? video,
      ProductVariantCombinationModel? productCombination,
      String? createdAt});

  $VideoPostModelCopyWith<$Res>? get video;
  $ProductVariantCombinationModelCopyWith<$Res>? get productCombination;
}

/// @nodoc
class _$UserProductCartModelCopyWithImpl<$Res,
        $Val extends UserProductCartModel>
    implements $UserProductCartModelCopyWith<$Res> {
  _$UserProductCartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProductCartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? createdByUserId = null,
    Object? price = null,
    Object? suggestedPrice = null,
    Object? points = null,
    Object? stock = null,
    Object? quantity = freezed,
    Object? video = freezed,
    Object? productCombination = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUserId: null == createdByUserId
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      suggestedPrice: null == suggestedPrice
          ? _value.suggestedPrice
          : suggestedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as VideoPostModel?,
      productCombination: freezed == productCombination
          ? _value.productCombination
          : productCombination // ignore: cast_nullable_to_non_nullable
              as ProductVariantCombinationModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of UserProductCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoPostModelCopyWith<$Res>? get video {
    if (_value.video == null) {
      return null;
    }

    return $VideoPostModelCopyWith<$Res>(_value.video!, (value) {
      return _then(_value.copyWith(video: value) as $Val);
    });
  }

  /// Create a copy of UserProductCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductVariantCombinationModelCopyWith<$Res>? get productCombination {
    if (_value.productCombination == null) {
      return null;
    }

    return $ProductVariantCombinationModelCopyWith<$Res>(
        _value.productCombination!, (value) {
      return _then(_value.copyWith(productCombination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProductCartModelImplCopyWith<$Res>
    implements $UserProductCartModelCopyWith<$Res> {
  factory _$$UserProductCartModelImplCopyWith(_$UserProductCartModelImpl value,
          $Res Function(_$UserProductCartModelImpl) then) =
      __$$UserProductCartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdBy,
      String createdByUserId,
      double price,
      double suggestedPrice,
      int points,
      int stock,
      int? quantity,
      VideoPostModel? video,
      ProductVariantCombinationModel? productCombination,
      String? createdAt});

  @override
  $VideoPostModelCopyWith<$Res>? get video;
  @override
  $ProductVariantCombinationModelCopyWith<$Res>? get productCombination;
}

/// @nodoc
class __$$UserProductCartModelImplCopyWithImpl<$Res>
    extends _$UserProductCartModelCopyWithImpl<$Res, _$UserProductCartModelImpl>
    implements _$$UserProductCartModelImplCopyWith<$Res> {
  __$$UserProductCartModelImplCopyWithImpl(_$UserProductCartModelImpl _value,
      $Res Function(_$UserProductCartModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProductCartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? createdByUserId = null,
    Object? price = null,
    Object? suggestedPrice = null,
    Object? points = null,
    Object? stock = null,
    Object? quantity = freezed,
    Object? video = freezed,
    Object? productCombination = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserProductCartModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUserId: null == createdByUserId
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      suggestedPrice: null == suggestedPrice
          ? _value.suggestedPrice
          : suggestedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as VideoPostModel?,
      productCombination: freezed == productCombination
          ? _value.productCombination
          : productCombination // ignore: cast_nullable_to_non_nullable
              as ProductVariantCombinationModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProductCartModelImpl extends _UserProductCartModel {
  const _$UserProductCartModelImpl(
      {required this.id,
      required this.createdBy,
      required this.createdByUserId,
      required this.price,
      required this.suggestedPrice,
      required this.points,
      required this.stock,
      this.quantity,
      this.video,
      this.productCombination,
      this.createdAt})
      : super._();

  factory _$UserProductCartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProductCartModelImplFromJson(json);

  @override
  final String id;
  @override
  final String createdBy;
  @override
  final String createdByUserId;
  @override
  final double price;
  @override
  final double suggestedPrice;
  @override
  final int points;
  @override
  final int stock;
  @override
  final int? quantity;
  @override
  final VideoPostModel? video;
  @override
  final ProductVariantCombinationModel? productCombination;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'UserProductCartModel(id: $id, createdBy: $createdBy, createdByUserId: $createdByUserId, price: $price, suggestedPrice: $suggestedPrice, points: $points, stock: $stock, quantity: $quantity, video: $video, productCombination: $productCombination, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProductCartModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.suggestedPrice, suggestedPrice) ||
                other.suggestedPrice == suggestedPrice) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.productCombination, productCombination) ||
                other.productCombination == productCombination) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdBy,
      createdByUserId,
      price,
      suggestedPrice,
      points,
      stock,
      quantity,
      video,
      productCombination,
      createdAt);

  /// Create a copy of UserProductCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProductCartModelImplCopyWith<_$UserProductCartModelImpl>
      get copyWith =>
          __$$UserProductCartModelImplCopyWithImpl<_$UserProductCartModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProductCartModelImplToJson(
      this,
    );
  }
}

abstract class _UserProductCartModel extends UserProductCartModel {
  const factory _UserProductCartModel(
      {required final String id,
      required final String createdBy,
      required final String createdByUserId,
      required final double price,
      required final double suggestedPrice,
      required final int points,
      required final int stock,
      final int? quantity,
      final VideoPostModel? video,
      final ProductVariantCombinationModel? productCombination,
      final String? createdAt}) = _$UserProductCartModelImpl;
  const _UserProductCartModel._() : super._();

  factory _UserProductCartModel.fromJson(Map<String, dynamic> json) =
      _$UserProductCartModelImpl.fromJson;

  @override
  String get id;
  @override
  String get createdBy;
  @override
  String get createdByUserId;
  @override
  double get price;
  @override
  double get suggestedPrice;
  @override
  int get points;
  @override
  int get stock;
  @override
  int? get quantity;
  @override
  VideoPostModel? get video;
  @override
  ProductVariantCombinationModel? get productCombination;
  @override
  String? get createdAt;

  /// Create a copy of UserProductCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProductCartModelImplCopyWith<_$UserProductCartModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
