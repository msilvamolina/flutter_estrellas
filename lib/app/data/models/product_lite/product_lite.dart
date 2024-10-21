import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'product_lite.freezed.dart';
part 'product_lite.g.dart';

@freezed
abstract class ProductLiteModel implements _$ProductLiteModel {
  const ProductLiteModel._();

  const factory ProductLiteModel({
    @JsonKey(name: '_id') required String id,
    String? provider,
    String? name,
    String? externalId,
    double? price,
    int? points,
    double? suggestedPrice,
    String? type,
    bool? isPercentage,
    bool? showInFeed,
    bool? active,
    String? thumbnail,
    String? createdAt,
    String? updatedAt,
  }) = _ProductLiteModel;

  factory ProductLiteModel.fromJson(Map<String, dynamic> json) =>
      _$ProductLiteModelFromJson(json);

  Map<String, dynamic> toDocument(String? imageUrl) {
    Map<String, dynamic> json = toJson();

    if (imageUrl != null) {
      json['thumbnail'] = imageUrl;
    }

    json['createdAt'] = ModelHelpers.dateToDocument(json['createdAt']);
    json['updatedAt'] = ModelHelpers.dateToDocument(json['updatedAt']);

    return json;
  }
}
