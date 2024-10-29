import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/data/models/city/city/city.dart';
import 'package:flutter_estrellas/app/data/models/product/product/product.dart';
import 'package:flutter_estrellas/app/data/models/product_image/product_image_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart';

import '../../../../services/api_services.dart';
import '../../../models/city/department/department.dart';
import '../../../models/product/product_firebase/product_firebase_model.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/provider/provider/provider_model.dart';

class SelectCityRepository {
  ApiServices services = ApiServices();

  Future<Either<String, List<DepartmentModel>>> getDepartments() async {
    String url = 'api/localities/departments';
    try {
      Response response = await services.getWithToken(url: url);

      if (response.statusCode != 200) {
        return left('Error status code: ${response.statusCode}');
      }
      dynamic json = jsonDecode(response.body);
      List<dynamic> bodyList = json['data'];

      if (bodyList.isEmpty) {
        return left('List Products is empty');
      }

      List<DepartmentModel> list = List<DepartmentModel>.generate(
        bodyList.length,
        (int index) => DepartmentModel.fromJson(bodyList[index]),
      );

      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<CityModel>>> getCities(int departmentId) async {
    String url = 'api/localities/cities-by-department/$departmentId';
    try {
      Response response = await services.getWithToken(url: url);

      if (response.statusCode != 200) {
        return left('Error status code: ${response.statusCode}');
      }
      dynamic json = jsonDecode(response.body);
      List<dynamic> bodyList = json['data'];

      if (bodyList.isEmpty) {
        return left('List Products is empty');
      }

      List<CityModel> list = List<CityModel>.generate(
        bodyList.length,
        (int index) => CityModel.fromJson(bodyList[index]),
      );

      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }
}
