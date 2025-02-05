import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
import 'package:flutter_estrellas/app/data/models/city/department/department_model.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:get/get.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:uuid/uuid.dart';

import '../../../models/city/city/city_model.dart';
import '../../../models/phone/phone_model.dart';
import '../../../models/user_product/user_product_model.dart';

class AddressRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

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

  Stream<List<DepartmentModel>> getDepartments() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('departments')
          .orderBy('name', descending: false)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => DepartmentModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<CityModel>> getCities(String departmentId) async* {
    try {
      int departmentIdInt = int.tryParse(departmentId) ?? 0;
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('cities')
          .where('department_id', isEqualTo: departmentIdInt)
          .orderBy('name', descending: false)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs.map((doc) {
          return CityModel.fromDocument(doc);
        }).toList();
      });
    } catch (e) {}
  }

  Stream<List<AddressModel>> getUserAddress() async* {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('addresses')
          .orderBy('createdAt', descending: true)
          .where('save', isEqualTo: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => AddressModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Either<String, AddressModel>> addAddress({
    required String fullname,
    required PhoneNumber phone,
    required String address,
    required String notes,
    required CityModel city,
    required DepartmentModel department,
    required bool save,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String addressId = Uuid().v4();
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('addresses')
          .doc(addressId)
          .set({
        'id': addressId,
        'fullname': fullname,
        'phone': {
          'number': phone.nsn.toString(),
          'countryCode': phone.countryCode.toString(),
          'isoCode': phone.isoCode.name.toString(),
        },
        'save': save,
        'notes': notes,
        'address': address,
        'city': city.toJson(),
        'department': department.toJson(),
        'createdAt': DateTime.now(),
      });

      AddressModel addressModel = AddressModel(
        id: addressId,
        fullname: fullname,
        phone: PhoneModel(
          number: phone.nsn.toString(),
          countryCode: phone.countryCode.toString(),
          isoCode: phone.isoCode.name.toString(),
        ),
        notes: notes,
        address: address,
        city: city,
        department: department,
      );
      return right(addressModel);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, AddressModel>> updateAddress({
    required String addressId,
    required String fullname,
    required PhoneNumber phone,
    required String address,
    required String notes,
    required CityModel city,
    required DepartmentModel department,
    required bool save,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('addresses')
          .doc(addressId)
          .update({
        'id': addressId,
        'fullname': fullname,
        'phone': {
          'number': phone.nsn.toString(),
          'countryCode': phone.countryCode.toString(),
          'isoCode': phone.isoCode.name.toString(),
        },
        'save': save,
        'notes': notes,
        'address': address,
        'city': city.toJson(),
        'department': department.toJson(),
        'createdAt': DateTime.now(),
      });

      AddressModel addressModel = AddressModel(
        id: addressId,
        fullname: fullname,
        phone: PhoneModel(
          number: phone.nsn.toString(),
          countryCode: phone.countryCode.toString(),
          isoCode: phone.isoCode.name.toString(),
        ),
        notes: notes,
        address: address,
        city: city,
        department: department,
      );
      return right(addressModel);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }
}
