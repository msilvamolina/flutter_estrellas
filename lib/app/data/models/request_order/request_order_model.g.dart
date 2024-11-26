// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOrderModelImpl _$$RequestOrderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOrderModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => VideoPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      video: json['video'] == null
          ? null
          : VideoPostModel.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RequestOrderModelImplToJson(
        _$RequestOrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
      'videos': instance.videos,
      'video': instance.video,
    };
