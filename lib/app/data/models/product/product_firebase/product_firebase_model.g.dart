// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductFirebaseModelImpl _$$ProductFirebaseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductFirebaseModelImpl(
      id: json['_id'] as String,
      provider: json['provider'],
      category: json['category'],
      name: json['name'] as String?,
      externalId: (json['externalId'] as num?)?.toInt(),
      stock: (json['stock'] as num?)?.toInt(),
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
      uploadDate: json['uploadDate'] as String?,
      searchField: json['searchField'] as String?,
    );

Map<String, dynamic> _$$ProductFirebaseModelImplToJson(
        _$ProductFirebaseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'provider': instance.provider,
      'category': instance.category,
      'name': instance.name,
      'externalId': instance.externalId,
      'stock': instance.stock,
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
      'uploadDate': instance.uploadDate,
      'searchField': instance.searchField,
    };
