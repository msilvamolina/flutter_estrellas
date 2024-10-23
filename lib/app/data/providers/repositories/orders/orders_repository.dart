import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
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
  // Future<Either<String, Unit>> createOrder() async {
  //   String url = 'api/orders/create-order';
  //   print('createOrder() ');
  //   try {
  //     dynamic headers = {
  //       'x-token':
  //           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2NDYzYjA2YTc0MjBiZjRkYTRjMWVjZWYiLCJpYXQiOjE3MjkxODA5OTksImV4cCI6MTcyOTI2NzM5OX0.kpxDRxnFzpxFm60ypSpw70BRYgJpQV1rVGCDzzYNNDY",
  //     };

  //     Map<String, String> body = {
  //       "city_id": "1222",
  //       "client_direction": "Cra 01 #12-34 B/ San Vicente",
  //       "client_email": "dianasierra@dropi.co",
  //       "client_name": "Super Martin Silva",
  //       "client_notes": "Holis",
  //       "client_phone": "3127559567",
  //       "client_quantity": '1',
  //       "client_surname": "Diana Patricia",
  //       "department_id": "81",
  //       "product_id": "67118d2ed9b74b6beec0c64d",
  //       "user_id": "6463b06a7420bf4da4c1ecef",
  //       // "variation_id": null,
  //     };
  //     Response response =
  //         await services.post(url: url, headers: headers, body: body);

  //     // if (response.statusCode != 200) {
  //     //   return left('Error status code: ${response.statusCode}');
  //     // }
  //     dynamic json = jsonDecode(response.body);
  //     // List<dynamic> bodyList = json['data']['providers'];

  //     // if (bodyList.isEmpty) {
  //     //   return left('List Products is empty');
  //     // }

  //     print(json.toString());
  //     // List<ProductModel> list = List<ProductModel>.generate(
  //     //   bodyList.length,
  //     //   (int index) => ProductModel.fromJson(bodyList[index]),
  //     // );

  //     return right(unit);
  //   } catch (e) {
  //     print('error: e');
  //     return left(e.toString());
  //   }
  // }

  Future<Either<String, Unit>> createMultipleOrder({
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
        // "city_id": address.city['dropi_id'],
        "city_id": "1222",
        "department_id": "81",

        "client_direction": address.address,
        "client_email": email,
        "client_name": address.fullname,
        "client_notes": address.notes,
        "client_phone": "3127559567",
        "client_surname": address.fullname,
        // "department_id": address.city['department_id'],
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
        return left(json['data']);
      }

      return right(unit);
    } catch (e) {
      print('error: $e');
      return left(e.toString());
    }
  }
}
