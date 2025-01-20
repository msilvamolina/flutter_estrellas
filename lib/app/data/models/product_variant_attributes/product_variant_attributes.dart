import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/friendly_helpers.dart';
import '../../helpers/model_helpers.dart';

part 'product_variant_attributes.freezed.dart';
part 'product_variant_attributes.g.dart';

@freezed
abstract class ProductVariantAttributesModel
    implements _$ProductVariantAttributesModel {
  const ProductVariantAttributesModel._();

  const factory ProductVariantAttributesModel({
    required String id,
    String? description,
    bool? isVariation,
    dynamic values,
  }) = _ProductVariantAttributesModel;

  factory ProductVariantAttributesModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantAttributesModelFromJson(json);

  factory ProductVariantAttributesModel.fromDocument(DocumentSnapshot doc) {
    return ProductVariantAttributesModel.fromJson(
        ModelHelpers.fromDocument(doc.data()!));
  }
}
