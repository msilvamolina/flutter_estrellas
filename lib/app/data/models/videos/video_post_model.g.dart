// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoPostModelImpl _$$VideoPostModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoPostModelImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      thumbnail: json['thumbnail'] as String,
      videoUrl: json['videoUrl'] as String,
      product: json['product'] == null
          ? null
          : ProductFirebaseLiteModel.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VideoPostModelImplToJson(
        _$VideoPostModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'thumbnail': instance.thumbnail,
      'videoUrl': instance.videoUrl,
      'product': instance.product,
    };
