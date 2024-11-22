import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_estrellas/app/data/models/city/city/city_model.dart';
import 'package:flutter_estrellas/app/data/models/city/department/department_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../phone/phone_model.dart';
import '../product/product_firebase/product_firebase_model.dart';

part 'bank_account_model.freezed.dart';
part 'bank_account_model.g.dart';

@freezed
abstract class BankAccountModel implements _$BankAccountModel {
  const BankAccountModel._();

  const factory BankAccountModel({
    required String id,
    required String bank,
    required String accountNumber,
    required String accountType,
    required String fullname,
    required String documentType,
    required String document,
  }) = _BankAccountModel;

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountModelFromJson(json);

  factory BankAccountModel.fromDocument(DocumentSnapshot doc) =>
      BankAccountModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
