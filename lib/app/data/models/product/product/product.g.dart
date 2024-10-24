// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['_id'] as String,
      provider: json['provider'] == null
          ? null
          : ProductProviderModel.fromJson(
              json['provider'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : ProductCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>),
      name: json['name'] as String?,
      externalId: json['externalId'] as String?,
      usefulId: json['usefulId'] as String?,
      videoUrl: json['videoUrl'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      sku: json['sku'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      active: json['active'] as bool?,
      isPercentage: json['isPercentage'] as bool?,
      points: (json['points'] as num?)?.toInt(),
      suggestedPrice: (json['suggestedPrice'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
      createdAt: json['createdAt'] as String?,
      uploadDate: json['uploadDate'] as String?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'provider': instance.provider,
      'category': instance.category,
      'name': instance.name,
      'externalId': instance.externalId,
      'usefulId': instance.usefulId,
      'videoUrl': instance.videoUrl,
      'description': instance.description,
      'type': instance.type,
      'sku': instance.sku,
      'price': instance.price,
      'active': instance.active,
      'isPercentage': instance.isPercentage,
      'points': instance.points,
      'suggestedPrice': instance.suggestedPrice,
      'thumbnail': instance.thumbnail,
      'createdAt': instance.createdAt,
      'uploadDate': instance.uploadDate,
    };
