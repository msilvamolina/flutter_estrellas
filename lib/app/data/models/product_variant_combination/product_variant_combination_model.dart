import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/friendly_helpers.dart';
import '../../helpers/model_helpers.dart';

part 'product_variant_combination_model.freezed.dart';
part 'product_variant_combination_model.g.dart';

@freezed
abstract class ProductVariantCombinationModel
    implements _$ProductVariantCombinationModel {
  const ProductVariantCombinationModel._();

  const factory ProductVariantCombinationModel({
    required String id,
    required String name,
    required String label,
    required String createdAt,
    String? dropiId,
    String? colorId,
    String? colorName,
    String? colorLabel,
    String? sizeId,
    String? sizeName,
    String? sizeLabel,
    double? price,
    double? suggestedPrice,
    int? points,
    int? stock,
    String? imageUrl,
    int? color,
    String? searchField,
    dynamic reference,
    String? updatedAt,
  }) = _ProductVariantCombinationModel;

  factory ProductVariantCombinationModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantCombinationModelFromJson(json);

  factory ProductVariantCombinationModel.fromDocument(DocumentSnapshot doc) {
    ProductVariantCombinationModel data =
        ProductVariantCombinationModel.fromJson(
            ModelHelpers.fromDocument(doc.data()!));
    String searchField = data.name;

    return data.copyWith(
      reference: doc.reference,
      searchField: FriendlyHelpers.friendlySearchField(searchField),
    );
  }

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());

  static Future<ProductVariantCombinationModel?> fromReference(
      dynamic reference) async {
    try {
      DocumentSnapshot<Object?>? data =
          await ModelHelpers.fromReference(reference as DocumentReference);

      if (data != null) {
        return ProductVariantCombinationModel.fromDocument(data);
      }

      return null;
    } catch (_) {
      return null;
    }
  }
}
