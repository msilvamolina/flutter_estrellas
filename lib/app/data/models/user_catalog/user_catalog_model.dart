import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_estrellas/app/data/models/videos/video_post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../product_firebase_lite/product_firebase_lite.dart';

part 'user_catalog_model.freezed.dart';
part 'user_catalog_model.g.dart';

@freezed
abstract class UserCatalogModel implements _$UserCatalogModel {
  const UserCatalogModel._();

  const factory UserCatalogModel({
    required String id,
    required String name,
    required String imageUrl,
    List<VideoPostModel>? videos,
  }) = _UserCatalogModel;

  factory UserCatalogModel.fromJson(Map<String, dynamic> json) =>
      _$UserCatalogModelFromJson(json);

  factory UserCatalogModel.fromDocument(DocumentSnapshot doc) =>
      UserCatalogModel.fromJson(ModelHelpers.fromDocument(doc.data()!));

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
