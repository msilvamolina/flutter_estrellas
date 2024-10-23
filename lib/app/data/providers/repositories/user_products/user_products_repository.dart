import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:get/get.dart';

class UserProductsRepository {
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

  Future<Either<String, Unit>> addToFavorites({
    required ProductFirebaseLiteModel productLite,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String email = userData['email'] ?? '';
    String productId = productLite.id;
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .doc(productId)
          .set({
        'product': productLite.toDocument(),
        'isAnonymous': false,
        'createdBy': email,
        'createdByUserId': uid,
        'createdAt': DateTime.now(),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> removeFromFavorites({
    required ProductFirebaseLiteModel productLite,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String productId = productLite.id;
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .doc(productId)
          .delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> addToCart({
    required ProductFirebaseLiteModel productLite,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String email = userData['email'] ?? '';
    String productId = productLite.id;
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(productId)
          .set({
        'product': productLite.toDocument(),
        'isAnonymous': false,
        'createdBy': email,
        'createdByUserId': uid,
        'createdAt': DateTime.now(),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> removeFromCart({
    required ProductFirebaseLiteModel productLite,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String productId = productLite.id;
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(productId)
          .delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }
}
