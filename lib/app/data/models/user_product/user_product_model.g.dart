// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProductModelImpl _$$UserProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProductModelImpl(
      createdBy: json['createdBy'] as String,
      createdByUserId: json['createdByUserId'] as String,
      video: json['video'] == null
          ? null
          : VideoPostModel.fromJson(json['video'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$UserProductModelImplToJson(
        _$UserProductModelImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdByUserId': instance.createdByUserId,
      'video': instance.video,
      'createdAt': instance.createdAt,
    };
