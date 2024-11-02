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
      imageUrl: json['imageUrl'] as String,
      createdBy: json['createdBy'] as String,
      createdByUserId: json['createdByUserId'] as String,
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => VideoPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserCatalogModelImplToJson(
        _$UserCatalogModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'createdBy': instance.createdBy,
      'createdByUserId': instance.createdByUserId,
      'videos': instance.videos,
    };
