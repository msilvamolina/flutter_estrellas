// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variant_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductVariantInfoModel _$ProductVariantInfoModelFromJson(
    Map<String, dynamic> json) {
  return _ProductVariantInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ProductVariantInfoModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int? get externalID => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  String? get searchField => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  double get sale_price => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  double get suggested_price => throw _privateConstructorUsedError;
  dynamic get values => throw _privateConstructorUsedError;

  /// Serializes this ProductVariantInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductVariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductVariantInfoModelCopyWith<ProductVariantInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantInfoModelCopyWith<$Res> {
  factory $ProductVariantInfoModelCopyWith(ProductVariantInfoModel value,
          $Res Function(ProductVariantInfoModel) then) =
      _$ProductVariantInfoModelCopyWithImpl<$Res, ProductVariantInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int? externalID,
      String? name,
      String? label,
      String? type,
      String? imageUrl,
      int? color,
      String? searchField,
      int points,
      double sale_price,
      String sku,
      int stock,
      double suggested_price,
      dynamic values});
}

/// @nodoc
class _$ProductVariantInfoModelCopyWithImpl<$Res,
        $Val extends ProductVariantInfoModel>
    implements $ProductVariantInfoModelCopyWith<$Res> {
  _$ProductVariantInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductVariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? externalID = freezed,
    Object? name = freezed,
    Object? label = freezed,
    Object? type = freezed,
    Object? imageUrl = freezed,
    Object? color = freezed,
    Object? searchField = freezed,
    Object? points = null,
    Object? sale_price = null,
    Object? sku = null,
    Object? stock = null,
    Object? suggested_price = null,
    Object? values = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      externalID: freezed == externalID
          ? _value.externalID
          : externalID // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      searchField: freezed == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      sale_price: null == sale_price
          ? _value.sale_price
          : sale_price // ignore: cast_nullable_to_non_nullable
              as double,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      suggested_price: null == suggested_price
          ? _value.suggested_price
          : suggested_price // ignore: cast_nullable_to_non_nullable
              as double,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantInfoModelImplCopyWith<$Res>
    implements $ProductVariantInfoModelCopyWith<$Res> {
  factory _$$ProductVariantInfoModelImplCopyWith(
          _$ProductVariantInfoModelImpl value,
          $Res Function(_$ProductVariantInfoModelImpl) then) =
      __$$ProductVariantInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int? externalID,
      String? name,
      String? label,
      String? type,
      String? imageUrl,
      int? color,
      String? searchField,
      int points,
      double sale_price,
      String sku,
      int stock,
      double suggested_price,
      dynamic values});
}

/// @nodoc
class __$$ProductVariantInfoModelImplCopyWithImpl<$Res>
    extends _$ProductVariantInfoModelCopyWithImpl<$Res,
        _$ProductVariantInfoModelImpl>
    implements _$$ProductVariantInfoModelImplCopyWith<$Res> {
  __$$ProductVariantInfoModelImplCopyWithImpl(
      _$ProductVariantInfoModelImpl _value,
      $Res Function(_$ProductVariantInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductVariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? externalID = freezed,
    Object? name = freezed,
    Object? label = freezed,
    Object? type = freezed,
    Object? imageUrl = freezed,
    Object? color = freezed,
    Object? searchField = freezed,
    Object? points = null,
    Object? sale_price = null,
    Object? sku = null,
    Object? stock = null,
    Object? suggested_price = null,
    Object? values = freezed,
  }) {
    return _then(_$ProductVariantInfoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      externalID: freezed == externalID
          ? _value.externalID
          : externalID // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      searchField: freezed == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      sale_price: null == sale_price
          ? _value.sale_price
          : sale_price // ignore: cast_nullable_to_non_nullable
              as double,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      suggested_price: null == suggested_price
          ? _value.suggested_price
          : suggested_price // ignore: cast_nullable_to_non_nullable
              as double,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductVariantInfoModelImpl extends _ProductVariantInfoModel {
  const _$ProductVariantInfoModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.externalID,
      this.name,
      this.label,
      this.type,
      this.imageUrl,
      this.color,
      this.searchField,
      required this.points,
      required this.sale_price,
      required this.sku,
      required this.stock,
      required this.suggested_price,
      this.values})
      : super._();

  factory _$ProductVariantInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductVariantInfoModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int? externalID;
  @override
  final String? name;
  @override
  final String? label;
  @override
  final String? type;
  @override
  final String? imageUrl;
  @override
  final int? color;
  @override
  final String? searchField;
  @override
  final int points;
  @override
  final double sale_price;
  @override
  final String sku;
  @override
  final int stock;
  @override
  final double suggested_price;
  @override
  final dynamic values;

  @override
  String toString() {
    return 'ProductVariantInfoModel(id: $id, externalID: $externalID, name: $name, label: $label, type: $type, imageUrl: $imageUrl, color: $color, searchField: $searchField, points: $points, sale_price: $sale_price, sku: $sku, stock: $stock, suggested_price: $suggested_price, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.externalID, externalID) ||
                other.externalID == externalID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.searchField, searchField) ||
                other.searchField == searchField) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.sale_price, sale_price) ||
                other.sale_price == sale_price) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.suggested_price, suggested_price) ||
                other.suggested_price == suggested_price) &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      externalID,
      name,
      label,
      type,
      imageUrl,
      color,
      searchField,
      points,
      sale_price,
      sku,
      stock,
      suggested_price,
      const DeepCollectionEquality().hash(values));

  /// Create a copy of ProductVariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantInfoModelImplCopyWith<_$ProductVariantInfoModelImpl>
      get copyWith => __$$ProductVariantInfoModelImplCopyWithImpl<
          _$ProductVariantInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductVariantInfoModelImplToJson(
      this,
    );
  }
}

abstract class _ProductVariantInfoModel extends ProductVariantInfoModel {
  const factory _ProductVariantInfoModel(
      {@JsonKey(name: '_id') final String? id,
      final int? externalID,
      final String? name,
      final String? label,
      final String? type,
      final String? imageUrl,
      final int? color,
      final String? searchField,
      required final int points,
      required final double sale_price,
      required final String sku,
      required final int stock,
      required final double suggested_price,
      final dynamic values}) = _$ProductVariantInfoModelImpl;
  const _ProductVariantInfoModel._() : super._();

  factory _ProductVariantInfoModel.fromJson(Map<String, dynamic> json) =
      _$ProductVariantInfoModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  int? get externalID;
  @override
  String? get name;
  @override
  String? get label;
  @override
  String? get type;
  @override
  String? get imageUrl;
  @override
  int? get color;
  @override
  String? get searchField;
  @override
  int get points;
  @override
  double get sale_price;
  @override
  String get sku;
  @override
  int get stock;
  @override
  double get suggested_price;
  @override
  dynamic get values;

  /// Create a copy of ProductVariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductVariantInfoModelImplCopyWith<_$ProductVariantInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
