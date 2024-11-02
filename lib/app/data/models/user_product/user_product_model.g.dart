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
      quantity: (json['quantity'] as num?)?.toInt(),
      videoPostModel: json['videoPostModel'] == null
          ? null
          : VideoPostModel.fromJson(
              json['videoPostModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProductModelImplToJson(
        _$UserProductModelImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdByUserId': instance.createdByUserId,
      'quantity': instance.quantity,
      'videoPostModel': instance.videoPostModel,
    };
