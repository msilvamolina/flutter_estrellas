// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_product_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProductCartModelImpl _$$UserProductCartModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProductCartModelImpl(
      id: json['id'] as String,
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

Map<String, dynamic> _$$UserProductCartModelImplToJson(
        _$UserProductCartModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
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
