import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../product/product_firebase/product_firebase_model.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class AddressModel implements _$AddressModel {
  const AddressModel._();

  const factory AddressModel({
    required String id,
    String? fullname,
    dynamic city,
    String? address,
    String? notes,
    String? phone,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  factory AddressModel.fromDocument(DocumentSnapshot doc) =>
      AddressModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
