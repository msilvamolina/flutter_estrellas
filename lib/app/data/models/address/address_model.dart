import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_estrellas/app/data/models/city/city/city_model.dart';
import 'package:flutter_estrellas/app/data/models/city/department/department_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../phone/phone_model.dart';
import '../product/product_firebase/product_firebase_model.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class AddressModel implements _$AddressModel {
  const AddressModel._();

  const factory AddressModel({
    required String id,
    String? fullname,
    CityModel? city,
    DepartmentModel? department,
    String? address,
    String? notes,
    PhoneModel? phone,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  factory AddressModel.fromDocument(DocumentSnapshot doc) =>
      AddressModel.fromJson(ModelHelpers.fromDocument(doc.data()!));

  Map<String, dynamic> toDocument() {
    dynamic json = toJson();
    if (city != null) {
      json['city'] = city!.toDocument();
    }

    if (department != null) {
      json['department'] = department!.toDocument();
    }

    if (phone != null) {
      json['phone'] = phone!.toDocument();
    }
    return json;
  }
}
