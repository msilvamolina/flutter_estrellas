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
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => VideoPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RequestOrderModelImplToJson(
        _$RequestOrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'videos': instance.videos,
    };
