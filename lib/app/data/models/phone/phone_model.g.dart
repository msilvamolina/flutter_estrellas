// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneModelImpl _$$PhoneModelImplFromJson(Map<String, dynamic> json) =>
    _$PhoneModelImpl(
      number: json['number'] as String,
      countryCode: json['countryCode'] as String?,
      isoCode: json['isoCode'] as String?,
    );

Map<String, dynamic> _$$PhoneModelImplToJson(_$PhoneModelImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'countryCode': instance.countryCode,
      'isoCode': instance.isoCode,
    };
