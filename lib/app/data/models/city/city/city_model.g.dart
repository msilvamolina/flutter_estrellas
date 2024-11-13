// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      id: json['_id'] as String,
      dropiId: (json['dropi_id'] as num?)?.toInt(),
      departmenId: (json['department_id'] as num?)?.toInt(),
      codeDane: json['cod_dane'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'dropi_id': instance.dropiId,
      'department_id': instance.departmenId,
      'cod_dane': instance.codeDane,
      'name': instance.name,
    };
