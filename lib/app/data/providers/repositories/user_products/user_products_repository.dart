import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/models/user_catalog/user_catalog_model.dart';
import 'package:flutter_estrellas/app/data/models/videos/video_post_model.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../models/user_product/user_product_model.dart';

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

  Stream<List<UserProductModel>> getUserFavorites() async* {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_favorites')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => UserProductModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<UserProductModel>> getUserCatalogPrivate() async* {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('catalog_private')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => UserProductModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<UserCatalogModel>> getUserCatalogs() async* {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('catalogs')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => UserCatalogModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<UserProductModel>> getUserCart() async* {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => UserProductModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Either<String, Unit>> addToFavorites({
    required VideoPostModel videoPostModel,
  }) async {
    if (videoPostModel.product == null) {
      return left('El producto no puede estar vacío');
    }
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String email = userData['email'] ?? '';

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_favorites')
          .doc(videoPostModel.id)
          .set({
        'video': videoPostModel.toDocument(),
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

  Future<Either<String, Unit>> addToCatalogPrivate({
    required VideoPostModel videoPostModel,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String email = userData['email'] ?? '';
    String videoId = videoPostModel.id;
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_catalog_private')
          .doc(videoId)
          .set({
        'video': videoPostModel.toDocument(),
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

  Future<Either<String, Unit>> removeFromCatalogPrivate({
    required VideoPostModel videoPostModel,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String videoId = videoPostModel.id;
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_catalog_private')
          .doc(videoId)
          .delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> removeFromFavorites({
    required VideoPostModel videoPostModel,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_favorites')
          .doc(videoPostModel.id)
          .delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> createCatalog({
    required VideoPostModel videoPostModel,
    required String catalogName,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String email = userData['email'] ?? '';

    String id = Uuid().v4();
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_catalogs')
          .doc(id)
          .set({
        'id': id,
        'name': catalogName,
        'imageUrl': videoPostModel.product!.thumbnail,
        'videos': [
          videoPostModel.toJson(),
        ],
        'createdBy': email,
        'createdByUserId': uid,
        'createdAt': DateTime.now(),
      });

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> updateCatalogListProducts({
    required String catalogId,
    required List<dynamic> products,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('catalogs')
          .doc(catalogId)
          .update({'products': products});

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
