// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_lite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductLiteModelImpl _$$ProductLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductLiteModelImpl(
      id: json['_id'] as String,
      provider: json['provider'] as String?,
      name: json['name'] as String?,
      externalId: json['externalId'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      points: (json['points'] as num?)?.toInt(),
      suggestedPrice: (json['suggestedPrice'] as num?)?.toDouble(),
      type: json['type'] as String?,
      isPercentage: json['isPercentage'] as bool?,
      showInFeed: json['showInFeed'] as bool?,
      active: json['active'] as bool?,
      thumbnail: json['thumbnail'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ProductLiteModelImplToJson(
        _$ProductLiteModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'provider': instance.provider,
      'name': instance.name,
      'externalId': instance.externalId,
      'price': instance.price,
      'points': instance.points,
      'suggestedPrice': instance.suggestedPrice,
      'type': instance.type,
      'isPercentage': instance.isPercentage,
      'showInFeed': instance.showInFeed,
      'active': instance.active,
      'thumbnail': instance.thumbnail,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
