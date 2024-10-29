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
    required String name,
    required String label,
    required String createdAt,
    required String type,
    String? imageUrl,
    int? color,
    String? searchField,
    dynamic reference,
    String? updatedAt,
  }) = _ProductVariantModel;

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);

  factory ProductVariantModel.fromDocument(DocumentSnapshot doc) {
    ProductVariantModel data =
        ProductVariantModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
    String searchField = data.name;

    return data.copyWith(
      reference: doc.reference,
      searchField: FriendlyHelpers.friendlySearchField(searchField),
    );
  }

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());

  static Future<ProductVariantModel?> fromReference(dynamic reference) async {
    try {
      DocumentSnapshot<Object?>? data =
          await ModelHelpers.fromReference(reference as DocumentReference);

      if (data != null) {
        return ProductVariantModel.fromDocument(data);
      }

      return null;
    } catch (_) {
      return null;
    }
  }
}
