// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProductModel _$UserProductModelFromJson(Map<String, dynamic> json) {
  return _UserProductModel.fromJson(json);
}

/// @nodoc
mixin _$UserProductModel {
  String get createdBy => throw _privateConstructorUsedError;
  String get createdByUserId => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  ProductFirebaseLiteModel? get product => throw _privateConstructorUsedError;

  /// Serializes this UserProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProductModelCopyWith<UserProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProductModelCopyWith<$Res> {
  factory $UserProductModelCopyWith(
          UserProductModel value, $Res Function(UserProductModel) then) =
      _$UserProductModelCopyWithImpl<$Res, UserProductModel>;
  @useResult
  $Res call(
      {String createdBy,
      String createdByUserId,
      int? quantity,
      ProductFirebaseLiteModel? product});

  $ProductFirebaseLiteModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$UserProductModelCopyWithImpl<$Res, $Val extends UserProductModel>
    implements $UserProductModelCopyWith<$Res> {
  _$UserProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? createdByUserId = null,
    Object? quantity = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUserId: null == createdByUserId
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductFirebaseLiteModel?,
    ) as $Val);
  }

  /// Create a copy of UserProductModel
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
abstract class _$$UserProductModelImplCopyWith<$Res>
    implements $UserProductModelCopyWith<$Res> {
  factory _$$UserProductModelImplCopyWith(_$UserProductModelImpl value,
          $Res Function(_$UserProductModelImpl) then) =
      __$$UserProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String createdBy,
      String createdByUserId,
      int? quantity,
      ProductFirebaseLiteModel? product});

  @override
  $ProductFirebaseLiteModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$UserProductModelImplCopyWithImpl<$Res>
    extends _$UserProductModelCopyWithImpl<$Res, _$UserProductModelImpl>
    implements _$$UserProductModelImplCopyWith<$Res> {
  __$$UserProductModelImplCopyWithImpl(_$UserProductModelImpl _value,
      $Res Function(_$UserProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? createdByUserId = null,
    Object? quantity = freezed,
    Object? product = freezed,
  }) {
    return _then(_$UserProductModelImpl(
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUserId: null == createdByUserId
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductFirebaseLiteModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProductModelImpl extends _UserProductModel {
  const _$UserProductModelImpl(
      {required this.createdBy,
      required this.createdByUserId,
      this.quantity,
      this.product})
      : super._();

  factory _$UserProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProductModelImplFromJson(json);

  @override
  final String createdBy;
  @override
  final String createdByUserId;
  @override
  final int? quantity;
  @override
  final ProductFirebaseLiteModel? product;

  @override
  String toString() {
    return 'UserProductModel(createdBy: $createdBy, createdByUserId: $createdByUserId, quantity: $quantity, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProductModelImpl &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, createdBy, createdByUserId, quantity, product);

  /// Create a copy of UserProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProductModelImplCopyWith<_$UserProductModelImpl> get copyWith =>
      __$$UserProductModelImplCopyWithImpl<_$UserProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProductModelImplToJson(
      this,
    );
  }
}

abstract class _UserProductModel extends UserProductModel {
  const factory _UserProductModel(
      {required final String createdBy,
      required final String createdByUserId,
      final int? quantity,
      final ProductFirebaseLiteModel? product}) = _$UserProductModelImpl;
  const _UserProductModel._() : super._();

  factory _UserProductModel.fromJson(Map<String, dynamic> json) =
      _$UserProductModelImpl.fromJson;

  @override
  String get createdBy;
  @override
  String get createdByUserId;
  @override
  int? get quantity;
  @override
  ProductFirebaseLiteModel? get product;

  /// Create a copy of UserProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProductModelImplCopyWith<_$UserProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
