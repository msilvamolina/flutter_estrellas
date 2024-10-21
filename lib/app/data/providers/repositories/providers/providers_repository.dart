import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/data/models/product/product/product.dart';
import 'package:flutter_estrellas/app/data/models/product_image/product_image_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart';

import '../../../../services/api_services.dart';
import '../../../models/product/product_firebase/product_firebase_model.dart';
import '../../../models/product_variant/product_variant_model.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/provider/provider/provider_model.dart';

class ProvidersRepository {
  ApiServices services = ApiServices();
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = Get.find<FirebaseStorage>();

  Future<Either<String, List<ProviderModel>>> getProvidersFromBackend() async {
    String url = 'api/provider/get-all';
    try {
      Response response = await services.getWithToken(url: url);

      if (response.statusCode != 200) {
        return left('Error status code: ${response.statusCode}');
      }
      dynamic json = jsonDecode(response.body);
      List<dynamic> bodyList = json['data']['providers'];

      if (bodyList.isEmpty) {
        return left('List Products is empty');
      }

      List<ProviderModel> list = List<ProviderModel>.generate(
        bodyList.length,
        (int index) => ProviderModel.fromJson(bodyList[index]),
      );

      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> saveProviderInFirebase({
    required ProviderModel provider,
  }) async {
    try {
      await _firebaseFirestore
          .collection('providers')
          .doc(provider.id)
          .set(provider.toDocument());
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, ProviderModel>> createProvider({
    required String avatarURL,
    required String name,
    required String surname,
    required String email,
    required String phone,
    required String document,
    required String porcentage,
  }) async {
    String url = 'api/provider/create';
    try {
      Map<String, dynamic> body = {
        'email': email,
        'name': name,
        'surname': surname,
        'phone': phone,
        'document': document,
        'porcentage': porcentage,
      };

      Map<String, dynamic> fields = {
        'provider': jsonEncode(body),
      };

      StreamedResponse response = await services.postWithFileAndToken(
        url: url,
        fields: fields,
        fieldImageName: 'avatarURL',
        fieldImagePath: avatarURL,
      );

      if (response.statusCode != 200) {
        return left('Error status code: ${response.statusCode}');
      }

      String responseBody =
          await response.stream.transform(utf8.decoder).join();

      dynamic json = jsonDecode(responseBody);
      bool ok = json['ok'] ?? false;

      if (!ok) {
        return left(json['data']);
      }

      ProviderModel providerModel = ProviderModel.fromJson(json['data']);

      return right(providerModel);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, ProviderModel>> createWarehouse({
    required String name,
    required String phone,
    required String city,
    required String address,
    required String provider,
  }) async {
    String url = 'api/provider/create-warehouse';
    try {
      Map<String, dynamic> body = {
        "name": name,
        "phone": phone,
        "city": '6569e63abcefff5266ac0778',
        "address": address,
        "provider": provider
      };
      Response response = await services.postWithToken(url: url, body: body);

      dynamic json = jsonDecode(response.body);
      bool ok = json['ok'] ?? false;

      if (!ok) {
        return left(json['data']);
      }

      ProviderModel providerModel = ProviderModel.fromJson(json['data']);

      return right(providerModel);
    } catch (e) {
      return left(e.toString());
    }
  }
}
