import 'dart:convert';

import 'package:get/instance_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

class ApiServices {
  static var client = http.Client();
  String baseUrl = "content-750539670627.us-east1.run.app";
}
