import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'variant_attributte.freezed.dart';
part 'variant_attributte.g.dart';

@freezed
abstract class VariantAttributeModel with _$VariantAttributeModel {
  const factory VariantAttributeModel({
    required String id,
    required String name,
    required String createdBy,
  }) = _VariantAttributeModel;

  factory VariantAttributeModel.fromJson(Map<String, dynamic> json) =>
      _$VariantAttributeModelFromJson(json);

  factory VariantAttributeModel.fromDocument(DocumentSnapshot doc) {
    VariantAttributeModel data =
        VariantAttributeModel.fromJson(ModelHelpers.fromDocument(doc.data()!));

    return data;
  }
}
