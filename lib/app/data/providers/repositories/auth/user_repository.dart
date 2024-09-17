import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    required String username,
    required String firstName,
    required String lastName,
  }) async {
    try {
      User currentUser = _firebaseAuth.currentUser!;
      String uid = currentUser.uid;
      String email = currentUser.email!;

      await _firebaseFirestore.collection('users').doc(uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'username': username.toLowerCase(),
        'document': document,
        'uid': uid,
        'isAnonymous': false,
        'createdBy': email,
        'createdAt': DateTime.now(),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
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
