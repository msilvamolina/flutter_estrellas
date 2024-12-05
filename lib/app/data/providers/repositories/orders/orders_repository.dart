import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
import 'package:flutter_estrellas/app/data/models/payments_types/payments_types_model.dart';
import 'package:flutter_estrellas/app/data/models/user_product/user_product_model.dart';
import 'package:flutter_estrellas/app/data/models/user_product_cart/user_product_cart_model.dart';
import 'package:get/instance_manager.dart';

import '../../../../services/api_services.dart';
import 'package:http/http.dart';

class OrdersRepository {
  ApiServices services = ApiServices();
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Map<String, String> getUidAndEmail() {
    User? currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      String uid = currentUser.uid;
      String? email = currentUser.email; // Email puede ser nulo

      return {
        'uid': uid,
        'email': email ?? 'No email found' // Evitar valores nulos
      };
    } else {
      return {'uid': 'No UID found', 'email': 'No email found'};
    }
  }

  Future<Either<String, String>> createOrder({
    required String id,
    required UserProductCartModel product,
    required AddressModel address,
    required PaymentMethod paymentMethod,
  }) async {
    String url = 'api/orders/create-order';
    Map<String, String> userData = getUidAndEmail();
    String email = userData['email'] ?? '';
    String uid = userData['uid'] ?? '';
    try {
      Map<String, dynamic> body = {
        "city_id": address.city?.dropiId,
        "department_id": address.department?.dropiId,
        "client_direction": address.address,
        "client_email": email,
        "client_name": address.fullname,
        "client_notes": address.notes,
        "client_phone": "3127559567",
        "client_quantity": product.quantity.toString(),
        "client_surname": address.fullname,
        "product_id": product.video?.product?.id,
        "user_id": "6463b06a7420bf4da4c1ecef",
      };

      String bodyJson = jsonEncode(body);

      Response response = await services.postWithTokenJson(
        url: url,
        body: bodyJson,
      );

      dynamic json = jsonDecode(response.body);

      if (!json['ok']) {
        if (json['data'] != null) {
          return left(json['data'].toString());
        } else if (json['errors'] != null) {
          return left(json['errors'].toString());
        }
        return left('Ocurrió un error');
      }
      String orderNumber = json['data'].toString();

      List<dynamic> products = [];

      products.add(product.toDocument());
      try {
        await _firebaseFirestore
            .collection('users')
            .doc(uid)
            .collection('orders')
            .doc(id)
            .set({
          'id': id,
          'type': 'uniqueProduct',
          'products': products,
          'orderId': orderNumber,
          'address': address.toDocument(),
          'body': body,
          'paymentMethod': paymentMethod.name,
          'createdBy': email,
          'createdByUserId': uid,
          'createdAt': DateTime.now(),
        });
        return right(orderNumber);
      } on FirebaseException catch (e) {
        return left(e.code);
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> createMultipleOrder({
    required String id,
    required dynamic products,
    required List<dynamic> productsDocuments,
    required AddressModel address,
    required PaymentMethod paymentMethod,
  }) async {
    String url = 'api/orders/create-order';
    Map<String, String> userData = getUidAndEmail();

    String email = userData['email'] ?? '';
    String uid = userData['uid'] ?? '';
    try {
      var catalogue = {
        "id": "66f1e6f58b85f745c53f2fa1",
        "products": products,
      };

      Map<String, dynamic> body = {
        "city_id": address.city?.dropiId,
        "department_id": address.department?.dropiId,
        "client_direction": address.address,
        "client_email": email,
        "client_name": address.fullname,
        "client_notes": address.notes,
        "client_phone": address.phone!.number,
        "client_surname": address.fullname,
        "catalogue": catalogue,
        "user_id": "6463b06a7420bf4da4c1ecef",
      };

      String bodyJson = jsonEncode(body);

      Response response = await services.postWithTokenJson(
        url: url,
        body: bodyJson,
      );

      dynamic json = jsonDecode(response.body);

      if (!json['ok']) {
        if (json['data'] != null) {
          return left(json['data'].toString());
        } else if (json['errors'] != null) {
          return left(json['errors'].toString());
        }
        return left('Ocurrió un error');
      }
      String orderNumber = json['data'].toString();

      try {
        await _firebaseFirestore
            .collection('users')
            .doc(uid)
            .collection('orders')
            .doc(id)
            .set({
          'id': id,
          'type': 'multipleProducts',
          'products': productsDocuments,
          'orderId': orderNumber,
          'address': address.toDocument(),
          'body': body,
          'paymentMethod': paymentMethod.name,
          'createdBy': email,
          'createdByUserId': uid,
          'createdAt': DateTime.now(),
        });
        return right(orderNumber);
      } on FirebaseException catch (e) {
        return left(e.code);
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> saveOrder({
    required String id,
    required String orderNumber,
  }) async {
    String url = 'api/orders/?id=$orderNumber&user=6463b06a7420bf4da4c1ecef';
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Response response = await services.getWithToken(url: url);

      dynamic json = jsonDecode(response.body);

      Map<String, dynamic>? filteredOrder =
          _filterOrder(json, int.parse(orderNumber));

      if (filteredOrder != null) {
        try {
          await _firebaseFirestore
              .collection('users')
              .doc(uid)
              .collection('orders')
              .doc(id)
              .update({
            'orderData': filteredOrder,
          });
          return right(unit);
        } on FirebaseException catch (e) {
          return left(e.code);
        }
      } else {
        log('No se encontró la orden con el número $orderNumber');
      }

      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }

  Map<String, dynamic>? _filterOrder(dynamic json, int orderNumber) {
    if (json['ok'] == true &&
        json['data'] != null &&
        json['data']['orders'] != null) {
      List<dynamic> orders = json['data']['orders'];
      return orders.firstWhere(
        (order) => order['orderId'] == orderNumber,
        orElse: () => null,
      );
    }

    return null;
  }
}
