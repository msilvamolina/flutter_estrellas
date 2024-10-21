// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      dropiId: (json['dropi_id'] as num).toInt(),
      departmenId: (json['department_id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'dropi_id': instance.dropiId,
      'department_id': instance.departmenId,
      'name': instance.name,
    };
