// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProviderModelImpl _$$ProviderModelImplFromJson(Map<String, dynamic> json) =>
    _$ProviderModelImpl(
      id: json['_id'] as String,
      warehouses: (json['warehouses'] as List<dynamic>?)
          ?.map(
              (e) => ProviderWarehouseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalID: (json['externalID'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      document: json['document'] as String?,
      phone: json['phone'] as String?,
      isActive: json['isActive'] as bool?,
      porcentage: (json['porcentage'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      uploadDate: json['uploadDate'] as String?,
      updatedAt: json['updatedAt'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$ProviderModelImplToJson(_$ProviderModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'warehouses': instance.warehouses,
      'externalID': instance.externalID,
      'name': instance.name,
      'email': instance.email,
      'document': instance.document,
      'phone': instance.phone,
      'isActive': instance.isActive,
      'porcentage': instance.porcentage,
      'createdAt': instance.createdAt,
      'uploadDate': instance.uploadDate,
      'updatedAt': instance.updatedAt,
      'avatarUrl': instance.avatarUrl,
    };
