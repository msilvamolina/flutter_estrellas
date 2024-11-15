// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_firebase_lite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductFirebaseLiteModelImpl _$$ProductFirebaseLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductFirebaseLiteModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String?,
      provider: json['provider'],
      externalId: (json['externalId'] as num?)?.toInt(),
      stock: (json['stock'] as num?)?.toInt(),
      type: json['type'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      active: json['active'] as bool?,
      points: (json['points'] as num?)?.toInt(),
      suggestedPrice: (json['suggestedPrice'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$ProductFirebaseLiteModelImplToJson(
        _$ProductFirebaseLiteModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'provider': instance.provider,
      'externalId': instance.externalId,
      'stock': instance.stock,
      'type': instance.type,
      'price': instance.price,
      'active': instance.active,
      'points': instance.points,
      'suggestedPrice': instance.suggestedPrice,
      'thumbnail': instance.thumbnail,
    };
