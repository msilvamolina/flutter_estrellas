// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VariantVariantModelImpl _$$VariantVariantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VariantVariantModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      value: json['value'] as String,
      attributeId: json['attributeId'] as String,
      attributeName: json['attributeName'] as String,
      isColor: json['isColor'] as bool,
      isImage: json['isImage'] as bool,
      imageUrl: json['imageUrl'] as String?,
      standardImage: json['standardImage'] as String?,
      fullImage: json['fullImage'] as String?,
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$$VariantVariantModelImplToJson(
        _$VariantVariantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'attributeId': instance.attributeId,
      'attributeName': instance.attributeName,
      'isColor': instance.isColor,
      'isImage': instance.isImage,
      'imageUrl': instance.imageUrl,
      'standardImage': instance.standardImage,
      'fullImage': instance.fullImage,
      'createdBy': instance.createdBy,
    };
