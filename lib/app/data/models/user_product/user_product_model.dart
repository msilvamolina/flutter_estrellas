import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../product_firebase_lite/product_firebase_lite.dart';

part 'user_product_model.freezed.dart';
part 'user_product_model.g.dart';

@freezed
abstract class UserProductModel implements _$UserProductModel {
  const UserProductModel._();

  const factory UserProductModel({
    required String createdBy,
    required String createdByUserId,
    int? quantity,
    ProductFirebaseLiteModel? product,
  }) = _UserProductModel;

  factory UserProductModel.fromJson(Map<String, dynamic> json) =>
      _$UserProductModelFromJson(json);

  factory UserProductModel.fromDocument(DocumentSnapshot doc) =>
      UserProductModel.fromJson(ModelHelpers.fromDocument(doc.data()!));

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
