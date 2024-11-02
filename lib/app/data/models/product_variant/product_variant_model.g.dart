// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductVariantModelImpl _$$ProductVariantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductVariantModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      label: json['label'] as String,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String?,
      color: (json['color'] as num?)?.toInt(),
      searchField: json['searchField'] as String?,
    );

Map<String, dynamic> _$$ProductVariantModelImplToJson(
        _$ProductVariantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'color': instance.color,
      'searchField': instance.searchField,
    };
