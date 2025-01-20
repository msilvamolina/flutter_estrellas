// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImageModelImpl _$$ProductImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductImageModelImpl(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      imageUrl: json['imageUrl'] as String,
      fullImage: json['fullImage'] as String?,
      imagesMap: (json['imagesMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      standardImage: json['standardImage'] as String?,
    );

Map<String, dynamic> _$$ProductImageModelImplToJson(
        _$ProductImageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'imageUrl': instance.imageUrl,
      'fullImage': instance.fullImage,
      'imagesMap': instance.imagesMap,
      'standardImage': instance.standardImage,
    };
