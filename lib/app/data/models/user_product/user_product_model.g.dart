// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProductModelImpl _$$UserProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProductModelImpl(
      createdAt: json['createdAt'] as String,
      createdByEmail: json['createdByEmail'] as String,
      createdByUserId: json['createdByUserId'] as String,
      product: json['product'] == null
          ? null
          : ProductFirebaseLiteModel.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProductModelImplToJson(
        _$UserProductModelImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'createdByEmail': instance.createdByEmail,
      'createdByUserId': instance.createdByUserId,
      'product': instance.product,
    };
