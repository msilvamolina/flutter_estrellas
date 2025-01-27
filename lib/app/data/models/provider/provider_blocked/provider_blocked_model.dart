import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helpers/model_helpers.dart';
import '../warehouse/provider_warehouse_model.dart';

part 'provider_blocked_model.freezed.dart';
part 'provider_blocked_model.g.dart';

@freezed
abstract class ProviderBlockedModel implements _$ProviderBlockedModel {
  const ProviderBlockedModel._();

  const factory ProviderBlockedModel({
    required String providerId,
    required String providerName,
    required String providerAvatarUrl,
  }) = _ProviderBlockedModel;

  factory ProviderBlockedModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderBlockedModelFromJson(json);

  factory ProviderBlockedModel.fromDocument(DocumentSnapshot doc) {
    return ProviderBlockedModel.fromJson(
        ModelHelpers.fromDocument(doc.data()!));
  }
  Map<String, dynamic> toDocument() {
    Map<String, dynamic> json = toJson();
    return json;
  }
}
