import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/phone/phone_model.dart';
import 'package:get/get.dart';

import '../../../models/user_data/user_data.dart';
import '../../local/local_storage.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  bool isUserLogged() => _firebaseAuth.currentUser != null;

  Future<void> signOut() async {
    if (_firebaseAuth.currentUser != null) {
      _firebaseAuth.signOut();

      _localStorage.cleanAll();
    }
  }

  Future<User?> getUser() async {
    return _firebaseAuth.currentUser;
  }

  Future<Either<String, Unit>> saveUserData({
    required String document,
    required String fullName,
    required String email,
    required PhoneModel phone,
    String? imageUrl,
  }) async {
    try {
      User currentUser = _firebaseAuth.currentUser!;
      String uid = currentUser.uid;
      String email = currentUser.email!;

      await _firebaseFirestore.collection('users').doc(uid).set({
        'document': document,
        'fullName': fullName,
        'email': email,
        'phone': phone.toJson(),
        'imageUrl': imageUrl,
        'uid': uid,
        'createdAt': DateTime.now(),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<bool> isEmailVerified() async {
    User? currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      await currentUser
          .reload(); // Recargar la información del usuario desde Firebase
      return currentUser
          .emailVerified; // Devuelve el estado de verificación del email
    }

    return false; // No hay usuario logueado
  }

  String? getUserEmail() {
    if (_firebaseAuth.currentUser != null) {
      User currentUser = _firebaseAuth.currentUser!;
      String? email = currentUser.email;
      return email;
    }

    return null;
  }

  String? getUserID() {
    if (_firebaseAuth.currentUser != null) {
      User currentUser = _firebaseAuth.currentUser!;
      String? uid = currentUser.uid;
      return uid;
    }

    return null;
  }

  Future<UserData?> getUserDataFirebase() async {
    User currentUser = _firebaseAuth.currentUser!;
    String email = currentUser.email!;

    try {
      QuerySnapshot snapshots = await _firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (snapshots.docs.isNotEmpty) {
        return UserData.fromDocument(snapshots.docs.first);
      }

      return null;
    } on Exception catch (_) {
      return null;
    }
  }
}
