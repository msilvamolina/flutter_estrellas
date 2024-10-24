import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helpers/model_helpers.dart';
import '../category/product_category.dart';
import '../provider/product_provider.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class ProductModel implements _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    @JsonKey(name: '_id') required String id,
    ProductProviderModel? provider,
    ProductCategoryModel? category,
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
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toDocument() {
    Map<String, dynamic> json = toJson();

    if (provider != null) {
      json['provider'] = provider!.toJson();
    }
    if (category != null) {
      json['category'] = category!.toJson();
    }

    json['createdAt'] = ModelHelpers.dateToDocument(json['createdAt']);
    json['updatedAt'] = ModelHelpers.dateToDocument(json['updatedAt']);

    return json;
  }
}
