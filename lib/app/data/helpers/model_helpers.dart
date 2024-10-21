import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ModelHelpers {
  ModelHelpers._();

  static Map<String, dynamic> fromDocument(dynamic data) {
    data['createdAt'] = dateFromDocument(data['createdAt']);

    if (data['updatedAt'] != null) {
      data['updatedAt'] = dateFromDocument(data['updatedAt']);
    } else {
      data['updatedAt'] = data['createdAt'];
    }
    if (data['initDate'] != null) {
      data['initDate'] = dateFromDocument(data['initDate']);
    }
    return data;
  }

  static Map<String, dynamic> toDocument(Map<String, dynamic> json) {
    json = json..remove('warehouses');
    json['createdAt'] = dateToDocument(json['createdAt']);
    json['updatedAt'] = dateToDocument(json['updatedAt']);
    return json;
  }

  static String dateFromDocument(dynamic date) {
    if (date != null) {
      return date.toDate().toString();
    }
    return DateTime.now().toString();
  }

  static DateTime dateToDocument(String? date) {
    if (date != null) {
      return DateTime.parse(date);
    }
    return DateTime.now();
  }

  static Future<DocumentSnapshot?> fromReference(
      DocumentReference reference) async {
    try {
      return await reference.get();
    } on FirebaseException catch (_) {
      return null;
    }
  }
}
