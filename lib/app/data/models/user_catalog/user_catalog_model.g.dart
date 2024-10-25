// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCatalogModelImpl _$$UserCatalogModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCatalogModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      createdBy: json['createdBy'] as String,
      createdByUserId: json['createdByUserId'] as String,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) =>
              ProductFirebaseLiteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserCatalogModelImplToJson(
        _$UserCatalogModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdBy': instance.createdBy,
      'createdByUserId': instance.createdByUserId,
      'products': instance.products,
    };
