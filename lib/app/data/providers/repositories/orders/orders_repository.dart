import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
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
    required UserProductCartModel product,
    required AddressModel address,
  }) async {
    String url = 'api/orders/create-order';
    Map<String, String> userData = getUidAndEmail();

    String email = userData['email'] ?? '';
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
      }
      return right(json['data'].toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> createMultipleOrder({
    required dynamic products,
    required AddressModel address,
  }) async {
    String url = 'api/orders/create-order';
    Map<String, String> userData = getUidAndEmail();

    String email = userData['email'] ?? '';
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

      print('json $json');
      if (!json['ok']) {
        if (json['data'] != null) {
          return left(json['data'].toString());
        } else if (json['errors'] != null) {
          return left(json['errors'].toString());
        }
      }

      return right(json['data'].toString());
    } catch (e) {
      print('error: $e');
      return left(e.toString());
    }
  }
}
