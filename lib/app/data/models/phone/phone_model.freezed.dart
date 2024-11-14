// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhoneModel _$PhoneModelFromJson(Map<String, dynamic> json) {
  return _PhoneModel.fromJson(json);
}

/// @nodoc
mixin _$PhoneModel {
  String get number => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get isoCode => throw _privateConstructorUsedError;

  /// Serializes this PhoneModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneModelCopyWith<PhoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneModelCopyWith<$Res> {
  factory $PhoneModelCopyWith(
          PhoneModel value, $Res Function(PhoneModel) then) =
      _$PhoneModelCopyWithImpl<$Res, PhoneModel>;
  @useResult
  $Res call({String number, String? countryCode, String? isoCode});
}

/// @nodoc
class _$PhoneModelCopyWithImpl<$Res, $Val extends PhoneModel>
    implements $PhoneModelCopyWith<$Res> {
  _$PhoneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? countryCode = freezed,
    Object? isoCode = freezed,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCode: freezed == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneModelImplCopyWith<$Res>
    implements $PhoneModelCopyWith<$Res> {
  factory _$$PhoneModelImplCopyWith(
          _$PhoneModelImpl value, $Res Function(_$PhoneModelImpl) then) =
      __$$PhoneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String number, String? countryCode, String? isoCode});
}

/// @nodoc
class __$$PhoneModelImplCopyWithImpl<$Res>
    extends _$PhoneModelCopyWithImpl<$Res, _$PhoneModelImpl>
    implements _$$PhoneModelImplCopyWith<$Res> {
  __$$PhoneModelImplCopyWithImpl(
      _$PhoneModelImpl _value, $Res Function(_$PhoneModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? countryCode = freezed,
    Object? isoCode = freezed,
  }) {
    return _then(_$PhoneModelImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCode: freezed == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneModelImpl extends _PhoneModel {
  const _$PhoneModelImpl({required this.number, this.countryCode, this.isoCode})
      : super._();

  factory _$PhoneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneModelImplFromJson(json);

  @override
  final String number;
  @override
  final String? countryCode;
  @override
  final String? isoCode;

  @override
  String toString() {
    return 'PhoneModel(number: $number, countryCode: $countryCode, isoCode: $isoCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.isoCode, isoCode) || other.isoCode == isoCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, countryCode, isoCode);

  /// Create a copy of PhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneModelImplCopyWith<_$PhoneModelImpl> get copyWith =>
      __$$PhoneModelImplCopyWithImpl<_$PhoneModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneModelImplToJson(
      this,
    );
  }
}

abstract class _PhoneModel extends PhoneModel {
  const factory _PhoneModel(
      {required final String number,
      final String? countryCode,
      final String? isoCode}) = _$PhoneModelImpl;
  const _PhoneModel._() : super._();

  factory _PhoneModel.fromJson(Map<String, dynamic> json) =
      _$PhoneModelImpl.fromJson;

  @override
  String get number;
  @override
  String? get countryCode;
  @override
  String? get isoCode;

  /// Create a copy of PhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneModelImplCopyWith<_$PhoneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
