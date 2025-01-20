import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'variant_variant.freezed.dart';
part 'variant_variant.g.dart';

@freezed
abstract class VariantVariantModel with _$VariantVariantModel {
  const factory VariantVariantModel({
    required String id,
    required String name,
    required String value,
    required String attributeId,
    required String attributeName,
    required bool isColor,
    required bool isImage,
    String? imageUrl,
    String? standardImage,
    String? fullImage,
    String? createdBy,
  }) = _VariantVariantModel;

  factory VariantVariantModel.fromJson(Map<String, dynamic> json) =>
      _$VariantVariantModelFromJson(json);

  factory VariantVariantModel.fromDocument(DocumentSnapshot doc) {
    VariantVariantModel data =
        VariantVariantModel.fromJson(ModelHelpers.fromDocument(doc.data()!));

    return data;
  }
}
