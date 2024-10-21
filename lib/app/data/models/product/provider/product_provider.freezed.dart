// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductProviderModel _$ProductProviderModelFromJson(Map<String, dynamic> json) {
  return _ProductProviderModel.fromJson(json);
}

/// @nodoc
mixin _$ProductProviderModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this ProductProviderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductProviderModelCopyWith<ProductProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductProviderModelCopyWith<$Res> {
  factory $ProductProviderModelCopyWith(ProductProviderModel value,
          $Res Function(ProductProviderModel) then) =
      _$ProductProviderModelCopyWithImpl<$Res, ProductProviderModel>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String? name, String? avatarUrl});
}

/// @nodoc
class _$ProductProviderModelCopyWithImpl<$Res,
        $Val extends ProductProviderModel>
    implements $ProductProviderModelCopyWith<$Res> {
  _$ProductProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatarUrl = freezed,
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
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductProviderModelImplCopyWith<$Res>
    implements $ProductProviderModelCopyWith<$Res> {
  factory _$$ProductProviderModelImplCopyWith(_$ProductProviderModelImpl value,
          $Res Function(_$ProductProviderModelImpl) then) =
      __$$ProductProviderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String? name, String? avatarUrl});
}

/// @nodoc
class __$$ProductProviderModelImplCopyWithImpl<$Res>
    extends _$ProductProviderModelCopyWithImpl<$Res, _$ProductProviderModelImpl>
    implements _$$ProductProviderModelImplCopyWith<$Res> {
  __$$ProductProviderModelImplCopyWithImpl(_$ProductProviderModelImpl _value,
      $Res Function(_$ProductProviderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$ProductProviderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductProviderModelImpl implements _ProductProviderModel {
  const _$ProductProviderModelImpl(
      {@JsonKey(name: '_id') required this.id, this.name, this.avatarUrl});

  factory _$ProductProviderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductProviderModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? name;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'ProductProviderModel(id: $id, name: $name, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductProviderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatarUrl);

  /// Create a copy of ProductProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductProviderModelImplCopyWith<_$ProductProviderModelImpl>
      get copyWith =>
          __$$ProductProviderModelImplCopyWithImpl<_$ProductProviderModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductProviderModelImplToJson(
      this,
    );
  }
}

abstract class _ProductProviderModel implements ProductProviderModel {
  const factory _ProductProviderModel(
      {@JsonKey(name: '_id') required final String id,
      final String? name,
      final String? avatarUrl}) = _$ProductProviderModelImpl;

  factory _ProductProviderModel.fromJson(Map<String, dynamic> json) =
      _$ProductProviderModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get name;
  @override
  String? get avatarUrl;

  /// Create a copy of ProductProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductProviderModelImplCopyWith<_$ProductProviderModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
