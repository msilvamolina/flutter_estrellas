import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_estrellas/app/data/models/user_catalog/user_catalog_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../address/address_model.dart';
import '../user_product_cart/user_product_cart_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel implements _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    required String id,
    required AddressModel? address,
    required dynamic body,
    required dynamic orderData,
    required double amount,
    // required int orderId,
    required String paymentMethod,
    required String type,
    required String status,
    required double profit,
    required int points,
    required String createdAt,
    required List<UserProductCartModel> products,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  factory OrderModel.fromDocument(DocumentSnapshot doc) =>
      OrderModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
