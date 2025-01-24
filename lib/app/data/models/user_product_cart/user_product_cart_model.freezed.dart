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
  double get price => throw _privateConstructorUsedError;
  double get suggestedPrice => throw _privateConstructorUsedError;
  String get providerId => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  VideoPostModel? get video => throw _privateConstructorUsedError;
  String? get variantID => throw _privateConstructorUsedError;
  dynamic get variantInfo =>
      throw _privateConstructorUsedError; // ProductVariantCombinationModel? productCombination,
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
      double price,
      double suggestedPrice,
      String providerId,
      int points,
      int stock,
      int? quantity,
      VideoPostModel? video,
      String? variantID,
      dynamic variantInfo,
      String? createdAt});

  $VideoPostModelCopyWith<$Res>? get video;
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
    Object? price = null,
    Object? suggestedPrice = null,
    Object? providerId = null,
    Object? points = null,
    Object? stock = null,
    Object? quantity = freezed,
    Object? video = freezed,
    Object? variantID = freezed,
    Object? variantInfo = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      suggestedPrice: null == suggestedPrice
          ? _value.suggestedPrice
          : suggestedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
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
      variantID: freezed == variantID
          ? _value.variantID
          : variantID // ignore: cast_nullable_to_non_nullable
              as String?,
      variantInfo: freezed == variantInfo
          ? _value.variantInfo
          : variantInfo // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      double price,
      double suggestedPrice,
      String providerId,
      int points,
      int stock,
      int? quantity,
      VideoPostModel? video,
      String? variantID,
      dynamic variantInfo,
      String? createdAt});

  @override
  $VideoPostModelCopyWith<$Res>? get video;
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
    Object? price = null,
    Object? suggestedPrice = null,
    Object? providerId = null,
    Object? points = null,
    Object? stock = null,
    Object? quantity = freezed,
    Object? video = freezed,
    Object? variantID = freezed,
    Object? variantInfo = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserProductCartModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      suggestedPrice: null == suggestedPrice
          ? _value.suggestedPrice
          : suggestedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
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
      variantID: freezed == variantID
          ? _value.variantID
          : variantID // ignore: cast_nullable_to_non_nullable
              as String?,
      variantInfo: freezed == variantInfo
          ? _value.variantInfo
          : variantInfo // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      required this.price,
      required this.suggestedPrice,
      required this.providerId,
      required this.points,
      required this.stock,
      this.quantity,
      this.video,
      this.variantID,
      this.variantInfo,
      this.createdAt})
      : super._();

  factory _$UserProductCartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProductCartModelImplFromJson(json);

  @override
  final String id;
  @override
  final double price;
  @override
  final double suggestedPrice;
  @override
  final String providerId;
  @override
  final int points;
  @override
  final int stock;
  @override
  final int? quantity;
  @override
  final VideoPostModel? video;
  @override
  final String? variantID;
  @override
  final dynamic variantInfo;
// ProductVariantCombinationModel? productCombination,
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'UserProductCartModel(id: $id, price: $price, suggestedPrice: $suggestedPrice, providerId: $providerId, points: $points, stock: $stock, quantity: $quantity, video: $video, variantID: $variantID, variantInfo: $variantInfo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProductCartModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.suggestedPrice, suggestedPrice) ||
                other.suggestedPrice == suggestedPrice) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.variantID, variantID) ||
                other.variantID == variantID) &&
            const DeepCollectionEquality()
                .equals(other.variantInfo, variantInfo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      suggestedPrice,
      providerId,
      points,
      stock,
      quantity,
      video,
      variantID,
      const DeepCollectionEquality().hash(variantInfo),
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
      required final double price,
      required final double suggestedPrice,
      required final String providerId,
      required final int points,
      required final int stock,
      final int? quantity,
      final VideoPostModel? video,
      final String? variantID,
      final dynamic variantInfo,
      final String? createdAt}) = _$UserProductCartModelImpl;
  const _UserProductCartModel._() : super._();

  factory _UserProductCartModel.fromJson(Map<String, dynamic> json) =
      _$UserProductCartModelImpl.fromJson;

  @override
  String get id;
  @override
  double get price;
  @override
  double get suggestedPrice;
  @override
  String get providerId;
  @override
  int get points;
  @override
  int get stock;
  @override
  int? get quantity;
  @override
  VideoPostModel? get video;
  @override
  String? get variantID;
  @override
  dynamic
      get variantInfo; // ProductVariantCombinationModel? productCombination,
  @override
  String? get createdAt;

  /// Create a copy of UserProductCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProductCartModelImplCopyWith<_$UserProductCartModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
