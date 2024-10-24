// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: json['id'] as String,
      fullname: json['fullname'] as String?,
      city: json['city'],
      address: json['address'] as String?,
      notes: json['notes'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'city': instance.city,
      'address': instance.address,
      'notes': instance.notes,
      'phone': instance.phone,
    };
