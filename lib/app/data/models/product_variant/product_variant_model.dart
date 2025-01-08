import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/friendly_helpers.dart';
import '../../helpers/model_helpers.dart';

part 'product_variant_model.freezed.dart';
part 'product_variant_model.g.dart';

@freezed
abstract class ProductVariantModel implements _$ProductVariantModel {
  const ProductVariantModel._();

  const factory ProductVariantModel({
    required String id,
    String? name,
    String? label,
    String? type,
    String? imageUrl,
    int? color,
    String? searchField,
    required int points,
    required double sale_price,
    required String sku,
    required int stock,
    required double suggested_price,
    dynamic values,
  }) = _ProductVariantModel;

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);

  factory ProductVariantModel.fromDocument(DocumentSnapshot doc) {
    return ProductVariantModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
  }
}
