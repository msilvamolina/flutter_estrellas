// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_warehouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProviderWarehouseModelImpl _$$ProviderWarehouseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProviderWarehouseModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      externalID: json['externalID'] as String?,
    );

Map<String, dynamic> _$$ProviderWarehouseModelImplToJson(
        _$ProviderWarehouseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'city': instance.city,
      'address': instance.address,
      'externalID': instance.externalID,
    };
