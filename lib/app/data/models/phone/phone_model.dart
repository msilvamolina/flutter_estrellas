import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_estrellas/app/data/models/city/city/city_model.dart';
import 'package:flutter_estrellas/app/data/models/city/department/department_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../product/product_firebase/product_firebase_model.dart';

part 'phone_model.freezed.dart';
part 'phone_model.g.dart';

@freezed
abstract class PhoneModel implements _$PhoneModel {
  const PhoneModel._();

  const factory PhoneModel({
    required String number,
    String? countryCode,
    String? isoCode,
  }) = _PhoneModel;

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);

  factory PhoneModel.fromDocument(DocumentSnapshot doc) =>
      PhoneModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
