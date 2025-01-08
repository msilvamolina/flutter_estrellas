// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variant_attributes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductVariantAttributesModel _$ProductVariantAttributesModelFromJson(
    Map<String, dynamic> json) {
  return _ProductVariantAttributesModel.fromJson(json);
}

/// @nodoc
mixin _$ProductVariantAttributesModel {
  String get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get isVariation => throw _privateConstructorUsedError;
  dynamic get values => throw _privateConstructorUsedError;

  /// Serializes this ProductVariantAttributesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductVariantAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductVariantAttributesModelCopyWith<ProductVariantAttributesModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantAttributesModelCopyWith<$Res> {
  factory $ProductVariantAttributesModelCopyWith(
          ProductVariantAttributesModel value,
          $Res Function(ProductVariantAttributesModel) then) =
      _$ProductVariantAttributesModelCopyWithImpl<$Res,
          ProductVariantAttributesModel>;
  @useResult
  $Res call(
      {String id, String? description, bool? isVariation, dynamic values});
}

/// @nodoc
class _$ProductVariantAttributesModelCopyWithImpl<$Res,
        $Val extends ProductVariantAttributesModel>
    implements $ProductVariantAttributesModelCopyWith<$Res> {
  _$ProductVariantAttributesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductVariantAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? isVariation = freezed,
    Object? values = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isVariation: freezed == isVariation
          ? _value.isVariation
          : isVariation // ignore: cast_nullable_to_non_nullable
              as bool?,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantAttributesModelImplCopyWith<$Res>
    implements $ProductVariantAttributesModelCopyWith<$Res> {
  factory _$$ProductVariantAttributesModelImplCopyWith(
          _$ProductVariantAttributesModelImpl value,
          $Res Function(_$ProductVariantAttributesModelImpl) then) =
      __$$ProductVariantAttributesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String? description, bool? isVariation, dynamic values});
}

/// @nodoc
class __$$ProductVariantAttributesModelImplCopyWithImpl<$Res>
    extends _$ProductVariantAttributesModelCopyWithImpl<$Res,
        _$ProductVariantAttributesModelImpl>
    implements _$$ProductVariantAttributesModelImplCopyWith<$Res> {
  __$$ProductVariantAttributesModelImplCopyWithImpl(
      _$ProductVariantAttributesModelImpl _value,
      $Res Function(_$ProductVariantAttributesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductVariantAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? isVariation = freezed,
    Object? values = freezed,
  }) {
    return _then(_$ProductVariantAttributesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isVariation: freezed == isVariation
          ? _value.isVariation
          : isVariation // ignore: cast_nullable_to_non_nullable
              as bool?,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductVariantAttributesModelImpl
    extends _ProductVariantAttributesModel {
  const _$ProductVariantAttributesModelImpl(
      {required this.id, this.description, this.isVariation, this.values})
      : super._();

  factory _$ProductVariantAttributesModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProductVariantAttributesModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? description;
  @override
  final bool? isVariation;
  @override
  final dynamic values;

  @override
  String toString() {
    return 'ProductVariantAttributesModel(id: $id, description: $description, isVariation: $isVariation, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantAttributesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isVariation, isVariation) ||
                other.isVariation == isVariation) &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, isVariation,
      const DeepCollectionEquality().hash(values));

  /// Create a copy of ProductVariantAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantAttributesModelImplCopyWith<
          _$ProductVariantAttributesModelImpl>
      get copyWith => __$$ProductVariantAttributesModelImplCopyWithImpl<
          _$ProductVariantAttributesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductVariantAttributesModelImplToJson(
      this,
    );
  }
}

abstract class _ProductVariantAttributesModel
    extends ProductVariantAttributesModel {
  const factory _ProductVariantAttributesModel(
      {required final String id,
      final String? description,
      final bool? isVariation,
      final dynamic values}) = _$ProductVariantAttributesModelImpl;
  const _ProductVariantAttributesModel._() : super._();

  factory _ProductVariantAttributesModel.fromJson(Map<String, dynamic> json) =
      _$ProductVariantAttributesModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get description;
  @override
  bool? get isVariation;
  @override
  dynamic get values;

  /// Create a copy of ProductVariantAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductVariantAttributesModelImplCopyWith<
          _$ProductVariantAttributesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
