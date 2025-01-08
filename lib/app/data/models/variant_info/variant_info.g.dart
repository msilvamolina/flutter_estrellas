// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VariantInfoModelImpl _$$VariantInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VariantInfoModelImpl(
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map(
              (e) => VariantAttributeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => VariantVariantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$$VariantInfoModelImplToJson(
        _$VariantInfoModelImpl instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'variants': instance.variants,
      'createdBy': instance.createdBy,
    };
