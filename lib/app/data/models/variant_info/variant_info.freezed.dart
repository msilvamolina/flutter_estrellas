// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VariantInfoModel _$VariantInfoModelFromJson(Map<String, dynamic> json) {
  return _VariantInfoModel.fromJson(json);
}

/// @nodoc
mixin _$VariantInfoModel {
  List<VariantAttributeModel>? get attributes =>
      throw _privateConstructorUsedError;
  List<VariantVariantModel>? get variants => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;

  /// Serializes this VariantInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariantInfoModelCopyWith<VariantInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantInfoModelCopyWith<$Res> {
  factory $VariantInfoModelCopyWith(
          VariantInfoModel value, $Res Function(VariantInfoModel) then) =
      _$VariantInfoModelCopyWithImpl<$Res, VariantInfoModel>;
  @useResult
  $Res call(
      {List<VariantAttributeModel>? attributes,
      List<VariantVariantModel>? variants,
      String? createdBy});
}

/// @nodoc
class _$VariantInfoModelCopyWithImpl<$Res, $Val extends VariantInfoModel>
    implements $VariantInfoModelCopyWith<$Res> {
  _$VariantInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = freezed,
    Object? variants = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_value.copyWith(
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<VariantAttributeModel>?,
      variants: freezed == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<VariantVariantModel>?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantInfoModelImplCopyWith<$Res>
    implements $VariantInfoModelCopyWith<$Res> {
  factory _$$VariantInfoModelImplCopyWith(_$VariantInfoModelImpl value,
          $Res Function(_$VariantInfoModelImpl) then) =
      __$$VariantInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<VariantAttributeModel>? attributes,
      List<VariantVariantModel>? variants,
      String? createdBy});
}

/// @nodoc
class __$$VariantInfoModelImplCopyWithImpl<$Res>
    extends _$VariantInfoModelCopyWithImpl<$Res, _$VariantInfoModelImpl>
    implements _$$VariantInfoModelImplCopyWith<$Res> {
  __$$VariantInfoModelImplCopyWithImpl(_$VariantInfoModelImpl _value,
      $Res Function(_$VariantInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = freezed,
    Object? variants = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_$VariantInfoModelImpl(
      attributes: freezed == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<VariantAttributeModel>?,
      variants: freezed == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<VariantVariantModel>?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariantInfoModelImpl implements _VariantInfoModel {
  const _$VariantInfoModelImpl(
      {final List<VariantAttributeModel>? attributes,
      final List<VariantVariantModel>? variants,
      this.createdBy})
      : _attributes = attributes,
        _variants = variants;

  factory _$VariantInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantInfoModelImplFromJson(json);

  final List<VariantAttributeModel>? _attributes;
  @override
  List<VariantAttributeModel>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<VariantVariantModel>? _variants;
  @override
  List<VariantVariantModel>? get variants {
    final value = _variants;
    if (value == null) return null;
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? createdBy;

  @override
  String toString() {
    return 'VariantInfoModel(attributes: $attributes, variants: $variants, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantInfoModelImpl &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_attributes),
      const DeepCollectionEquality().hash(_variants),
      createdBy);

  /// Create a copy of VariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantInfoModelImplCopyWith<_$VariantInfoModelImpl> get copyWith =>
      __$$VariantInfoModelImplCopyWithImpl<_$VariantInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantInfoModelImplToJson(
      this,
    );
  }
}

abstract class _VariantInfoModel implements VariantInfoModel {
  const factory _VariantInfoModel(
      {final List<VariantAttributeModel>? attributes,
      final List<VariantVariantModel>? variants,
      final String? createdBy}) = _$VariantInfoModelImpl;

  factory _VariantInfoModel.fromJson(Map<String, dynamic> json) =
      _$VariantInfoModelImpl.fromJson;

  @override
  List<VariantAttributeModel>? get attributes;
  @override
  List<VariantVariantModel>? get variants;
  @override
  String? get createdBy;

  /// Create a copy of VariantInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariantInfoModelImplCopyWith<_$VariantInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
