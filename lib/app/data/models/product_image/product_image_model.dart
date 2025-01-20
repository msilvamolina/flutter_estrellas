import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/friendly_helpers.dart';
import '../../helpers/model_helpers.dart';

part 'product_image_model.freezed.dart';
part 'product_image_model.g.dart';

@freezed
abstract class ProductImageModel implements _$ProductImageModel {
  const ProductImageModel._();

  const factory ProductImageModel({
    required String id,
    required String createdAt,
    required String imageUrl,
    String? fullImage,
    Map<String, String>? imagesMap,
    String? standardImage,
  }) = _ProductImageModel;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);

  factory ProductImageModel.fromDocument(DocumentSnapshot doc) {
    return ProductImageModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
  }

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
