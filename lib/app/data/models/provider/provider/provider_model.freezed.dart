// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProviderModel _$ProviderModelFromJson(Map<String, dynamic> json) {
  return _ProviderModel.fromJson(json);
}

/// @nodoc
mixin _$ProviderModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  List<ProviderWarehouseModel>? get warehouses =>
      throw _privateConstructorUsedError;
  int? get externalID => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get document => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get porcentage =>
      throw _privateConstructorUsedError; // String? createdAt,
// String? uploadDate,
// String? updatedAt,
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this ProviderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProviderModelCopyWith<ProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderModelCopyWith<$Res> {
  factory $ProviderModelCopyWith(
          ProviderModel value, $Res Function(ProviderModel) then) =
      _$ProviderModelCopyWithImpl<$Res, ProviderModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      List<ProviderWarehouseModel>? warehouses,
      int? externalID,
      String? name,
      String? email,
      String? document,
      String? phone,
      bool? isActive,
      int? porcentage,
      String? avatarUrl});
}

/// @nodoc
class _$ProviderModelCopyWithImpl<$Res, $Val extends ProviderModel>
    implements $ProviderModelCopyWith<$Res> {
  _$ProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? warehouses = freezed,
    Object? externalID = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? document = freezed,
    Object? phone = freezed,
    Object? isActive = freezed,
    Object? porcentage = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      warehouses: freezed == warehouses
          ? _value.warehouses
          : warehouses // ignore: cast_nullable_to_non_nullable
              as List<ProviderWarehouseModel>?,
      externalID: freezed == externalID
          ? _value.externalID
          : externalID // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      document: freezed == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      porcentage: freezed == porcentage
          ? _value.porcentage
          : porcentage // ignore: cast_nullable_to_non_nullable
              as int?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProviderModelImplCopyWith<$Res>
    implements $ProviderModelCopyWith<$Res> {
  factory _$$ProviderModelImplCopyWith(
          _$ProviderModelImpl value, $Res Function(_$ProviderModelImpl) then) =
      __$$ProviderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      List<ProviderWarehouseModel>? warehouses,
      int? externalID,
      String? name,
      String? email,
      String? document,
      String? phone,
      bool? isActive,
      int? porcentage,
      String? avatarUrl});
}

/// @nodoc
class __$$ProviderModelImplCopyWithImpl<$Res>
    extends _$ProviderModelCopyWithImpl<$Res, _$ProviderModelImpl>
    implements _$$ProviderModelImplCopyWith<$Res> {
  __$$ProviderModelImplCopyWithImpl(
      _$ProviderModelImpl _value, $Res Function(_$ProviderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? warehouses = freezed,
    Object? externalID = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? document = freezed,
    Object? phone = freezed,
    Object? isActive = freezed,
    Object? porcentage = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$ProviderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      warehouses: freezed == warehouses
          ? _value._warehouses
          : warehouses // ignore: cast_nullable_to_non_nullable
              as List<ProviderWarehouseModel>?,
      externalID: freezed == externalID
          ? _value.externalID
          : externalID // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      document: freezed == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      porcentage: freezed == porcentage
          ? _value.porcentage
          : porcentage // ignore: cast_nullable_to_non_nullable
              as int?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProviderModelImpl extends _ProviderModel {
  const _$ProviderModelImpl(
      {@JsonKey(name: '_id') required this.id,
      final List<ProviderWarehouseModel>? warehouses,
      this.externalID,
      this.name,
      this.email,
      this.document,
      this.phone,
      this.isActive,
      this.porcentage,
      this.avatarUrl})
      : _warehouses = warehouses,
        super._();

  factory _$ProviderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  final List<ProviderWarehouseModel>? _warehouses;
  @override
  List<ProviderWarehouseModel>? get warehouses {
    final value = _warehouses;
    if (value == null) return null;
    if (_warehouses is EqualUnmodifiableListView) return _warehouses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? externalID;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? document;
  @override
  final String? phone;
  @override
  final bool? isActive;
  @override
  final int? porcentage;
// String? createdAt,
// String? uploadDate,
// String? updatedAt,
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'ProviderModel(id: $id, warehouses: $warehouses, externalID: $externalID, name: $name, email: $email, document: $document, phone: $phone, isActive: $isActive, porcentage: $porcentage, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._warehouses, _warehouses) &&
            (identical(other.externalID, externalID) ||
                other.externalID == externalID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.document, document) ||
                other.document == document) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.porcentage, porcentage) ||
                other.porcentage == porcentage) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_warehouses),
      externalID,
      name,
      email,
      document,
      phone,
      isActive,
      porcentage,
      avatarUrl);

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderModelImplCopyWith<_$ProviderModelImpl> get copyWith =>
      __$$ProviderModelImplCopyWithImpl<_$ProviderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderModelImplToJson(
      this,
    );
  }
}

abstract class _ProviderModel extends ProviderModel {
  const factory _ProviderModel(
      {@JsonKey(name: '_id') required final String id,
      final List<ProviderWarehouseModel>? warehouses,
      final int? externalID,
      final String? name,
      final String? email,
      final String? document,
      final String? phone,
      final bool? isActive,
      final int? porcentage,
      final String? avatarUrl}) = _$ProviderModelImpl;
  const _ProviderModel._() : super._();

  factory _ProviderModel.fromJson(Map<String, dynamic> json) =
      _$ProviderModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  List<ProviderWarehouseModel>? get warehouses;
  @override
  int? get externalID;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get document;
  @override
  String? get phone;
  @override
  bool? get isActive;
  @override
  int? get porcentage; // String? createdAt,
// String? uploadDate,
// String? updatedAt,
  @override
  String? get avatarUrl;

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProviderModelImplCopyWith<_$ProviderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
