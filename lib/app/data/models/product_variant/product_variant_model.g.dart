// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductVariantModelImpl _$$ProductVariantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductVariantModelImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      searchField: json['searchField'] as String?,
      reference: json['reference'],
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ProductVariantModelImplToJson(
        _$ProductVariantModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'searchField': instance.searchField,
      'reference': instance.reference,
      'updatedAt': instance.updatedAt,
    };
