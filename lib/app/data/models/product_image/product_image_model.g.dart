// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImageModelImpl _$$ProductImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductImageModelImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      searchField: json['searchField'] as String?,
      reference: json['reference'],
    );

Map<String, dynamic> _$$ProductImageModelImplToJson(
        _$ProductImageModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'searchField': instance.searchField,
      'reference': instance.reference,
    };
