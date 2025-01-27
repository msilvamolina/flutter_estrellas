// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_blocked_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProviderBlockedModel _$ProviderBlockedModelFromJson(Map<String, dynamic> json) {
  return _ProviderBlockedModel.fromJson(json);
}

/// @nodoc
mixin _$ProviderBlockedModel {
  String get providerId => throw _privateConstructorUsedError;
  String get providerName => throw _privateConstructorUsedError;
  String get providerAvatarUrl => throw _privateConstructorUsedError;

  /// Serializes this ProviderBlockedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProviderBlockedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProviderBlockedModelCopyWith<ProviderBlockedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderBlockedModelCopyWith<$Res> {
  factory $ProviderBlockedModelCopyWith(ProviderBlockedModel value,
          $Res Function(ProviderBlockedModel) then) =
      _$ProviderBlockedModelCopyWithImpl<$Res, ProviderBlockedModel>;
  @useResult
  $Res call({String providerId, String providerName, String providerAvatarUrl});
}

/// @nodoc
class _$ProviderBlockedModelCopyWithImpl<$Res,
        $Val extends ProviderBlockedModel>
    implements $ProviderBlockedModelCopyWith<$Res> {
  _$ProviderBlockedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProviderBlockedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? providerName = null,
    Object? providerAvatarUrl = null,
  }) {
    return _then(_value.copyWith(
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      providerName: null == providerName
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String,
      providerAvatarUrl: null == providerAvatarUrl
          ? _value.providerAvatarUrl
          : providerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProviderBlockedModelImplCopyWith<$Res>
    implements $ProviderBlockedModelCopyWith<$Res> {
  factory _$$ProviderBlockedModelImplCopyWith(_$ProviderBlockedModelImpl value,
          $Res Function(_$ProviderBlockedModelImpl) then) =
      __$$ProviderBlockedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String providerId, String providerName, String providerAvatarUrl});
}

/// @nodoc
class __$$ProviderBlockedModelImplCopyWithImpl<$Res>
    extends _$ProviderBlockedModelCopyWithImpl<$Res, _$ProviderBlockedModelImpl>
    implements _$$ProviderBlockedModelImplCopyWith<$Res> {
  __$$ProviderBlockedModelImplCopyWithImpl(_$ProviderBlockedModelImpl _value,
      $Res Function(_$ProviderBlockedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProviderBlockedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? providerName = null,
    Object? providerAvatarUrl = null,
  }) {
    return _then(_$ProviderBlockedModelImpl(
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      providerName: null == providerName
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String,
      providerAvatarUrl: null == providerAvatarUrl
          ? _value.providerAvatarUrl
          : providerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProviderBlockedModelImpl extends _ProviderBlockedModel {
  const _$ProviderBlockedModelImpl(
      {required this.providerId,
      required this.providerName,
      required this.providerAvatarUrl})
      : super._();

  factory _$ProviderBlockedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderBlockedModelImplFromJson(json);

  @override
  final String providerId;
  @override
  final String providerName;
  @override
  final String providerAvatarUrl;

  @override
  String toString() {
    return 'ProviderBlockedModel(providerId: $providerId, providerName: $providerName, providerAvatarUrl: $providerAvatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderBlockedModelImpl &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.providerName, providerName) ||
                other.providerName == providerName) &&
            (identical(other.providerAvatarUrl, providerAvatarUrl) ||
                other.providerAvatarUrl == providerAvatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, providerId, providerName, providerAvatarUrl);

  /// Create a copy of ProviderBlockedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderBlockedModelImplCopyWith<_$ProviderBlockedModelImpl>
      get copyWith =>
          __$$ProviderBlockedModelImplCopyWithImpl<_$ProviderBlockedModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderBlockedModelImplToJson(
      this,
    );
  }
}

abstract class _ProviderBlockedModel extends ProviderBlockedModel {
  const factory _ProviderBlockedModel(
      {required final String providerId,
      required final String providerName,
      required final String providerAvatarUrl}) = _$ProviderBlockedModelImpl;
  const _ProviderBlockedModel._() : super._();

  factory _ProviderBlockedModel.fromJson(Map<String, dynamic> json) =
      _$ProviderBlockedModelImpl.fromJson;

  @override
  String get providerId;
  @override
  String get providerName;
  @override
  String get providerAvatarUrl;

  /// Create a copy of ProviderBlockedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProviderBlockedModelImplCopyWith<_$ProviderBlockedModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
