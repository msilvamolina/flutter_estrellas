// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductVariantAttributesModelImpl
    _$$ProductVariantAttributesModelImplFromJson(Map<String, dynamic> json) =>
        _$ProductVariantAttributesModelImpl(
          id: json['id'] as String,
          description: json['description'] as String?,
          isVariation: json['isVariation'] as bool?,
          values: json['values'],
        );

Map<String, dynamic> _$$ProductVariantAttributesModelImplToJson(
        _$ProductVariantAttributesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'isVariation': instance.isVariation,
      'values': instance.values,
    };
