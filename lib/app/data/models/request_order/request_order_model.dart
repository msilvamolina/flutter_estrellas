import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_estrellas/app/data/models/videos/video_post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../product_firebase_lite/product_firebase_lite.dart';

part 'request_order_model.freezed.dart';
part 'request_order_model.g.dart';

@freezed
abstract class RequestOrderModel implements _$RequestOrderModel {
  const RequestOrderModel._();

  const factory RequestOrderModel({
    required String id,
    required String title,
    required String imageUrl,
    required String type,
    String? catalogId,
    List<VideoPostModel>? videos,
    VideoPostModel? video,
  }) = _RequestOrderModel;

  factory RequestOrderModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderModelFromJson(json);

  factory RequestOrderModel.fromDocument(DocumentSnapshot doc) =>
      RequestOrderModel.fromJson(ModelHelpers.fromDocument(doc.data()!));

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
