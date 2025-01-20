// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant_attributte.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VariantAttributeModel _$VariantAttributeModelFromJson(
    Map<String, dynamic> json) {
  return _VariantAttributeModel.fromJson(json);
}

/// @nodoc
mixin _$VariantAttributeModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;

  /// Serializes this VariantAttributeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VariantAttributeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariantAttributeModelCopyWith<VariantAttributeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantAttributeModelCopyWith<$Res> {
  factory $VariantAttributeModelCopyWith(VariantAttributeModel value,
          $Res Function(VariantAttributeModel) then) =
      _$VariantAttributeModelCopyWithImpl<$Res, VariantAttributeModel>;
  @useResult
  $Res call({String id, String name, String createdBy});
}

/// @nodoc
class _$VariantAttributeModelCopyWithImpl<$Res,
        $Val extends VariantAttributeModel>
    implements $VariantAttributeModelCopyWith<$Res> {
  _$VariantAttributeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VariantAttributeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdBy = null,
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
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantAttributeModelImplCopyWith<$Res>
    implements $VariantAttributeModelCopyWith<$Res> {
  factory _$$VariantAttributeModelImplCopyWith(
          _$VariantAttributeModelImpl value,
          $Res Function(_$VariantAttributeModelImpl) then) =
      __$$VariantAttributeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String createdBy});
}

/// @nodoc
class __$$VariantAttributeModelImplCopyWithImpl<$Res>
    extends _$VariantAttributeModelCopyWithImpl<$Res,
        _$VariantAttributeModelImpl>
    implements _$$VariantAttributeModelImplCopyWith<$Res> {
  __$$VariantAttributeModelImplCopyWithImpl(_$VariantAttributeModelImpl _value,
      $Res Function(_$VariantAttributeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VariantAttributeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdBy = null,
  }) {
    return _then(_$VariantAttributeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariantAttributeModelImpl implements _VariantAttributeModel {
  const _$VariantAttributeModelImpl(
      {required this.id, required this.name, required this.createdBy});

  factory _$VariantAttributeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantAttributeModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String createdBy;

  @override
  String toString() {
    return 'VariantAttributeModel(id: $id, name: $name, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantAttributeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdBy);

  /// Create a copy of VariantAttributeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantAttributeModelImplCopyWith<_$VariantAttributeModelImpl>
      get copyWith => __$$VariantAttributeModelImplCopyWithImpl<
          _$VariantAttributeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantAttributeModelImplToJson(
      this,
    );
  }
}

abstract class _VariantAttributeModel implements VariantAttributeModel {
  const factory _VariantAttributeModel(
      {required final String id,
      required final String name,
      required final String createdBy}) = _$VariantAttributeModelImpl;

  factory _VariantAttributeModel.fromJson(Map<String, dynamic> json) =
      _$VariantAttributeModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get createdBy;

  /// Create a copy of VariantAttributeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariantAttributeModelImplCopyWith<_$VariantAttributeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
