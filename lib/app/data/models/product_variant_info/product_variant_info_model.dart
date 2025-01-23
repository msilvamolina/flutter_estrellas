import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/friendly_helpers.dart';
import '../../helpers/model_helpers.dart';

part 'product_variant_info_model.freezed.dart';
part 'product_variant_info_model.g.dart';

@freezed
abstract class ProductVariantInfoModel implements _$ProductVariantInfoModel {
  const ProductVariantInfoModel._();

  const factory ProductVariantInfoModel({
    @JsonKey(name: '_id') String? id0,
    String? id,
    int? externalID,
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
  }) = _ProductVariantInfoModel;

  factory ProductVariantInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantInfoModelFromJson(json);

  factory ProductVariantInfoModel.fromDocument(DocumentSnapshot doc) {
    return ProductVariantInfoModel.fromJson(
        ModelHelpers.fromDocument(doc.data()!));
  }

  Map<String, dynamic> toDocument() {
    dynamic json = toJson();

    String? id = json['id'];

    if (id == null) {
      id = json['id0'];
      json['id'] = id;
    }

    return json;
  }
}
