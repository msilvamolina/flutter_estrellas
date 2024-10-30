// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_combination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductVariantCombinationModelImpl
    _$$ProductVariantCombinationModelImplFromJson(Map<String, dynamic> json) =>
        _$ProductVariantCombinationModelImpl(
          id: json['id'] as String,
          name: json['name'] as String,
          label: json['label'] as String,
          createdAt: json['createdAt'] as String,
          dropiId: json['dropiId'] as String?,
          colorId: json['colorId'] as String?,
          colorName: json['colorName'] as String?,
          colorLabel: json['colorLabel'] as String?,
          sizeId: json['sizeId'] as String?,
          sizeName: json['sizeName'] as String?,
          sizeLabel: json['sizeLabel'] as String?,
          price: (json['price'] as num?)?.toDouble(),
          suggestedPrice: (json['suggestedPrice'] as num?)?.toDouble(),
          points: (json['points'] as num?)?.toInt(),
          stock: (json['stock'] as num?)?.toInt(),
          imageUrl: json['imageUrl'] as String?,
          color: (json['color'] as num?)?.toInt(),
          searchField: json['searchField'] as String?,
          reference: json['reference'],
          updatedAt: json['updatedAt'] as String?,
        );

Map<String, dynamic> _$$ProductVariantCombinationModelImplToJson(
        _$ProductVariantCombinationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'createdAt': instance.createdAt,
      'dropiId': instance.dropiId,
      'colorId': instance.colorId,
      'colorName': instance.colorName,
      'colorLabel': instance.colorLabel,
      'sizeId': instance.sizeId,
      'sizeName': instance.sizeName,
      'sizeLabel': instance.sizeLabel,
      'price': instance.price,
      'suggestedPrice': instance.suggestedPrice,
      'points': instance.points,
      'stock': instance.stock,
      'imageUrl': instance.imageUrl,
      'color': instance.color,
      'searchField': instance.searchField,
      'reference': instance.reference,
      'updatedAt': instance.updatedAt,
    };
