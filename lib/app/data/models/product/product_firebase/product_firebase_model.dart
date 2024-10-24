import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helpers/friendly_helpers.dart';
import '../../../helpers/model_helpers.dart';

part 'product_firebase_model.freezed.dart';
part 'product_firebase_model.g.dart';

@freezed
abstract class ProductFirebaseModel implements _$ProductFirebaseModel {
  const ProductFirebaseModel._();

  const factory ProductFirebaseModel({
    @JsonKey(name: '_id') required String id,
    dynamic provider,
    dynamic category,
    String? name,
    String? externalId,
    String? usefulId,
    String? videoUrl,
    String? description,
    String? type,
    String? sku,
    double? price,
    bool? active,
    bool? isPercentage,
    int? points,
    double? suggestedPrice,
    String? thumbnail,
    String? createdAt,
    String? uploadDate,
    String? searchField,
    dynamic reference,
    String? updatedAt,
  }) = _ProductFirebaseModel;

  factory ProductFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductFirebaseModelFromJson(json);

  factory ProductFirebaseModel.fromDocument(DocumentSnapshot doc) {
    ProductFirebaseModel data =
        ProductFirebaseModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
    String searchField = data.name ?? '';

    return data.copyWith(
      reference: doc.reference,
      searchField: FriendlyHelpers.friendlySearchField(searchField),
    );
  }

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());

  static Future<ProductFirebaseModel?> fromReference(dynamic reference) async {
    try {
      DocumentSnapshot<Object?>? data =
          await ModelHelpers.fromReference(reference as DocumentReference);

      if (data != null) {
        return ProductFirebaseModel.fromDocument(data);
      }

      return null;
    } catch (_) {
      return null;
    }
  }
}
