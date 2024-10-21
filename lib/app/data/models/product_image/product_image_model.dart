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
    required String name,
    required String id,
    required String createdAt,
    required String imageUrl,
    String? searchField,
    dynamic reference,
    String? updatedAt,
  }) = _ProductImageModel;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);

  factory ProductImageModel.fromDocument(DocumentSnapshot doc) {
    ProductImageModel data =
        ProductImageModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
    String searchField = data.name;

    return data.copyWith(
      reference: doc.reference,
      searchField: FriendlyHelpers.friendlySearchField(searchField),
    );
  }

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());

  static Future<ProductImageModel?> fromReference(dynamic reference) async {
    try {
      DocumentSnapshot<Object?>? data =
          await ModelHelpers.fromReference(reference as DocumentReference);

      if (data != null) {
        return ProductImageModel.fromDocument(data);
      }

      return null;
    } catch (_) {
      return null;
    }
  }
}
