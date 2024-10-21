// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_warehouse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProviderWarehouseModel _$ProviderWarehouseModelFromJson(
    Map<String, dynamic> json) {
  return _ProviderWarehouseModel.fromJson(json);
}

/// @nodoc
mixin _$ProviderWarehouseModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get externalID => throw _privateConstructorUsedError;

  /// Serializes this ProviderWarehouseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProviderWarehouseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProviderWarehouseModelCopyWith<ProviderWarehouseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderWarehouseModelCopyWith<$Res> {
  factory $ProviderWarehouseModelCopyWith(ProviderWarehouseModel value,
          $Res Function(ProviderWarehouseModel) then) =
      _$ProviderWarehouseModelCopyWithImpl<$Res, ProviderWarehouseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? name,
      String? phone,
      String? city,
      String? address,
      String? externalID});
}

/// @nodoc
class _$ProviderWarehouseModelCopyWithImpl<$Res,
        $Val extends ProviderWarehouseModel>
    implements $ProviderWarehouseModelCopyWith<$Res> {
  _$ProviderWarehouseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProviderWarehouseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? city = freezed,
    Object? address = freezed,
    Object? externalID = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      externalID: freezed == externalID
          ? _value.externalID
          : externalID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProviderWarehouseModelImplCopyWith<$Res>
    implements $ProviderWarehouseModelCopyWith<$Res> {
  factory _$$ProviderWarehouseModelImplCopyWith(
          _$ProviderWarehouseModelImpl value,
          $Res Function(_$ProviderWarehouseModelImpl) then) =
      __$$ProviderWarehouseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? name,
      String? phone,
      String? city,
      String? address,
      String? externalID});
}

/// @nodoc
class __$$ProviderWarehouseModelImplCopyWithImpl<$Res>
    extends _$ProviderWarehouseModelCopyWithImpl<$Res,
        _$ProviderWarehouseModelImpl>
    implements _$$ProviderWarehouseModelImplCopyWith<$Res> {
  __$$ProviderWarehouseModelImplCopyWithImpl(
      _$ProviderWarehouseModelImpl _value,
      $Res Function(_$ProviderWarehouseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProviderWarehouseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? city = freezed,
    Object? address = freezed,
    Object? externalID = freezed,
  }) {
    return _then(_$ProviderWarehouseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      externalID: freezed == externalID
          ? _value.externalID
          : externalID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProviderWarehouseModelImpl implements _ProviderWarehouseModel {
  const _$ProviderWarehouseModelImpl(
      {@JsonKey(name: '_id') required this.id,
      this.name,
      this.phone,
      this.city,
      this.address,
      this.externalID});

  factory _$ProviderWarehouseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderWarehouseModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? city;
  @override
  final String? address;
  @override
  final String? externalID;

  @override
  String toString() {
    return 'ProviderWarehouseModel(id: $id, name: $name, phone: $phone, city: $city, address: $address, externalID: $externalID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderWarehouseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.externalID, externalID) ||
                other.externalID == externalID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, phone, city, address, externalID);

  /// Create a copy of ProviderWarehouseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderWarehouseModelImplCopyWith<_$ProviderWarehouseModelImpl>
      get copyWith => __$$ProviderWarehouseModelImplCopyWithImpl<
          _$ProviderWarehouseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderWarehouseModelImplToJson(
      this,
    );
  }
}

abstract class _ProviderWarehouseModel implements ProviderWarehouseModel {
  const factory _ProviderWarehouseModel(
      {@JsonKey(name: '_id') required final String id,
      final String? name,
      final String? phone,
      final String? city,
      final String? address,
      final String? externalID}) = _$ProviderWarehouseModelImpl;

  factory _ProviderWarehouseModel.fromJson(Map<String, dynamic> json) =
      _$ProviderWarehouseModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get city;
  @override
  String? get address;
  @override
  String? get externalID;

  /// Create a copy of ProviderWarehouseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProviderWarehouseModelImplCopyWith<_$ProviderWarehouseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
