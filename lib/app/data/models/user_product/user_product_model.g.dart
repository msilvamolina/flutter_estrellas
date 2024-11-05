// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProductModelImpl _$$UserProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProductModelImpl(
      createdBy: json['createdBy'] as String,
      createdByUserId: json['createdByUserId'] as String,
      price: (json['price'] as num).toDouble(),
      suggestedPrice: (json['suggestedPrice'] as num).toDouble(),
      points: (json['points'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      video: json['video'] == null
          ? null
          : VideoPostModel.fromJson(json['video'] as Map<String, dynamic>),
      productCombination: json['productCombination'] == null
          ? null
          : ProductVariantCombinationModel.fromJson(
              json['productCombination'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$UserProductModelImplToJson(
        _$UserProductModelImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdByUserId': instance.createdByUserId,
      'price': instance.price,
      'suggestedPrice': instance.suggestedPrice,
      'points': instance.points,
      'stock': instance.stock,
      'quantity': instance.quantity,
      'video': instance.video,
      'productCombination': instance.productCombination,
      'createdAt': instance.createdAt,
    };
