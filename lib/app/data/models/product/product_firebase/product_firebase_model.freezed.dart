// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_firebase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductFirebaseModel _$ProductFirebaseModelFromJson(Map<String, dynamic> json) {
  return _ProductFirebaseModel.fromJson(json);
}

/// @nodoc
mixin _$ProductFirebaseModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  dynamic get provider => throw _privateConstructorUsedError;
  dynamic get category => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get externalId => throw _privateConstructorUsedError;
  String? get usefulId => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  bool? get isPercentage => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  double? get suggestedPrice => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get uploadDate => throw _privateConstructorUsedError;
  String? get searchField => throw _privateConstructorUsedError;
  dynamic get reference => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductFirebaseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductFirebaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductFirebaseModelCopyWith<ProductFirebaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFirebaseModelCopyWith<$Res> {
  factory $ProductFirebaseModelCopyWith(ProductFirebaseModel value,
          $Res Function(ProductFirebaseModel) then) =
      _$ProductFirebaseModelCopyWithImpl<$Res, ProductFirebaseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      dynamic provider,
      dynamic category,
      String? name,
      String? externalId,
      String? usefulId,
      String? videoUrl,
      String? description,
      String? type,
      String? sku,
      double? price,
      bool? active,
      bool? isPercentage,
      int? points,
      double? suggestedPrice,
      String? thumbnail,
      String? createdAt,
      String? uploadDate,
      String? searchField,
      dynamic reference,
      String? updatedAt});
}

/// @nodoc
class _$ProductFirebaseModelCopyWithImpl<$Res,
        $Val extends ProductFirebaseModel>
    implements $ProductFirebaseModelCopyWith<$Res> {
  _$ProductFirebaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductFirebaseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? provider = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? externalId = freezed,
    Object? usefulId = freezed,
    Object? videoUrl = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? sku = freezed,
    Object? price = freezed,
    Object? active = freezed,
    Object? isPercentage = freezed,
    Object? points = freezed,
    Object? suggestedPrice = freezed,
    Object? thumbnail = freezed,
    Object? createdAt = freezed,
    Object? uploadDate = freezed,
    Object? searchField = freezed,
    Object? reference = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as dynamic,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      usefulId: freezed == usefulId
          ? _value.usefulId
          : usefulId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPercentage: freezed == isPercentage
          ? _value.isPercentage
          : isPercentage // ignore: cast_nullable_to_non_nullable
              as bool?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      suggestedPrice: freezed == suggestedPrice
          ? _value.suggestedPrice
          : suggestedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadDate: freezed == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as String?,
      searchField: freezed == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductFirebaseModelImplCopyWith<$Res>
    implements $ProductFirebaseModelCopyWith<$Res> {
  factory _$$ProductFirebaseModelImplCopyWith(_$ProductFirebaseModelImpl value,
          $Res Function(_$ProductFirebaseModelImpl) then) =
      __$$ProductFirebaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      dynamic provider,
      dynamic category,
      String? name,
      String? externalId,
      String? usefulId,
      String? videoUrl,
      String? description,
      String? type,
      String? sku,
      double? price,
      bool? active,
      bool? isPercentage,
      int? points,
      double? suggestedPrice,
      String? thumbnail,
      String? createdAt,
      String? uploadDate,
      String? searchField,
      dynamic reference,
      String? updatedAt});
}

/// @nodoc
class __$$ProductFirebaseModelImplCopyWithImpl<$Res>
    extends _$ProductFirebaseModelCopyWithImpl<$Res, _$ProductFirebaseModelImpl>
    implements _$$ProductFirebaseModelImplCopyWith<$Res> {
  __$$ProductFirebaseModelImplCopyWithImpl(_$ProductFirebaseModelImpl _value,
      $Res Function(_$ProductFirebaseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductFirebaseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? provider = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? externalId = freezed,
    Object? usefulId = freezed,
    Object? videoUrl = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? sku = freezed,
    Object? price = freezed,
    Object? active = freezed,
    Object? isPercentage = freezed,
    Object? points = freezed,
    Object? suggestedPrice = freezed,
    Object? thumbnail = freezed,
    Object? createdAt = freezed,
    Object? uploadDate = freezed,
    Object? searchField = freezed,
    Object? reference = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProductFirebaseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as dynamic,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      usefulId: freezed == usefulId
          ? _value.usefulId
          : usefulId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPercentage: freezed == isPercentage
          ? _value.isPercentage
          : isPercentage // ignore: cast_nullable_to_non_nullable
              as bool?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      suggestedPrice: freezed == suggestedPrice
          ? _value.suggestedPrice
          : suggestedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadDate: freezed == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as String?,
      searchField: freezed == searchField
          ? _value.searchField
          : searchField // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductFirebaseModelImpl extends _ProductFirebaseModel {
  const _$ProductFirebaseModelImpl(
      {@JsonKey(name: '_id') required this.id,
      this.provider,
      this.category,
      this.name,
      this.externalId,
      this.usefulId,
      this.videoUrl,
      this.description,
      this.type,
      this.sku,
      this.price,
      this.active,
      this.isPercentage,
      this.points,
      this.suggestedPrice,
      this.thumbnail,
      this.createdAt,
      this.uploadDate,
      this.searchField,
      this.reference,
      this.updatedAt})
      : super._();

  factory _$ProductFirebaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductFirebaseModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final dynamic provider;
  @override
  final dynamic category;
  @override
  final String? name;
  @override
  final String? externalId;
  @override
  final String? usefulId;
  @override
  final String? videoUrl;
  @override
  final String? description;
  @override
  final String? type;
  @override
  final String? sku;
  @override
  final double? price;
  @override
  final bool? active;
  @override
  final bool? isPercentage;
  @override
  final int? points;
  @override
  final double? suggestedPrice;
  @override
  final String? thumbnail;
  @override
  final String? createdAt;
  @override
  final String? uploadDate;
  @override
  final String? searchField;
  @override
  final dynamic reference;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'ProductFirebaseModel(id: $id, provider: $provider, category: $category, name: $name, externalId: $externalId, usefulId: $usefulId, videoUrl: $videoUrl, description: $description, type: $type, sku: $sku, price: $price, active: $active, isPercentage: $isPercentage, points: $points, suggestedPrice: $suggestedPrice, thumbnail: $thumbnail, createdAt: $createdAt, uploadDate: $uploadDate, searchField: $searchField, reference: $reference, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFirebaseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.usefulId, usefulId) ||
                other.usefulId == usefulId) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isPercentage, isPercentage) ||
                other.isPercentage == isPercentage) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.suggestedPrice, suggestedPrice) ||
                other.suggestedPrice == suggestedPrice) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.searchField, searchField) ||
                other.searchField == searchField) &&
            const DeepCollectionEquality().equals(other.reference, reference) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(provider),
        const DeepCollectionEquality().hash(category),
        name,
        externalId,
        usefulId,
        videoUrl,
        description,
        type,
        sku,
        price,
        active,
        isPercentage,
        points,
        suggestedPrice,
        thumbnail,
        createdAt,
        uploadDate,
        searchField,
        const DeepCollectionEquality().hash(reference),
        updatedAt
      ]);

  /// Create a copy of ProductFirebaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFirebaseModelImplCopyWith<_$ProductFirebaseModelImpl>
      get copyWith =>
          __$$ProductFirebaseModelImplCopyWithImpl<_$ProductFirebaseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductFirebaseModelImplToJson(
      this,
    );
  }
}

abstract class _ProductFirebaseModel extends ProductFirebaseModel {
  const factory _ProductFirebaseModel(
      {@JsonKey(name: '_id') required final String id,
      final dynamic provider,
      final dynamic category,
      final String? name,
      final String? externalId,
      final String? usefulId,
      final String? videoUrl,
      final String? description,
      final String? type,
      final String? sku,
      final double? price,
      final bool? active,
      final bool? isPercentage,
      final int? points,
      final double? suggestedPrice,
      final String? thumbnail,
      final String? createdAt,
      final String? uploadDate,
      final String? searchField,
      final dynamic reference,
      final String? updatedAt}) = _$ProductFirebaseModelImpl;
  const _ProductFirebaseModel._() : super._();

  factory _ProductFirebaseModel.fromJson(Map<String, dynamic> json) =
      _$ProductFirebaseModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  dynamic get provider;
  @override
  dynamic get category;
  @override
  String? get name;
  @override
  String? get externalId;
  @override
  String? get usefulId;
  @override
  String? get videoUrl;
  @override
  String? get description;
  @override
  String? get type;
  @override
  String? get sku;
  @override
  double? get price;
  @override
  bool? get active;
  @override
  bool? get isPercentage;
  @override
  int? get points;
  @override
  double? get suggestedPrice;
  @override
  String? get thumbnail;
  @override
  String? get createdAt;
  @override
  String? get uploadDate;
  @override
  String? get searchField;
  @override
  dynamic get reference;
  @override
  String? get updatedAt;

  /// Create a copy of ProductFirebaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductFirebaseModelImplCopyWith<_$ProductFirebaseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
