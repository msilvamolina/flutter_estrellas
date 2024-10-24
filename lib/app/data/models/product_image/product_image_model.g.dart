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
      createdAt: json['createdAt'] as String,
      imageUrl: json['imageUrl'] as String,
      searchField: json['searchField'] as String?,
      reference: json['reference'],
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ProductImageModelImplToJson(
        _$ProductImageModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'imageUrl': instance.imageUrl,
      'searchField': instance.searchField,
      'reference': instance.reference,
      'updatedAt': instance.updatedAt,
    };
