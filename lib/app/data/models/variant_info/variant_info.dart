import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../variant_attributte/variant_attributte.dart';
import '../variant_variant/variant_variant.dart';

part 'variant_info.freezed.dart';
part 'variant_info.g.dart';

@freezed
abstract class VariantInfoModel with _$VariantInfoModel {
  const factory VariantInfoModel({
    List<VariantAttributeModel>? attributes,
    List<VariantVariantModel>? variants,
    String? createdBy,
  }) = _VariantInfoModel;

  factory VariantInfoModel.fromJson(Map<String, dynamic> json) =>
      _$VariantInfoModelFromJson(json);

  factory VariantInfoModel.fromDocument(DocumentSnapshot doc) {
    VariantInfoModel data =
        VariantInfoModel.fromJson(ModelHelpers.fromDocument(doc.data()!));

    return data;
  }
}
