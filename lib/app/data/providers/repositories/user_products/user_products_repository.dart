import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/order/order_model.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/data/models/request_order/request_order_model.dart';
import 'package:flutter_estrellas/app/data/models/user_catalog/user_catalog_model.dart';
import 'package:flutter_estrellas/app/data/models/videos/video_post_model.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../models/product_variant/product_variant_model.dart';
import '../../../models/product_variant_combination/product_variant_combination_model.dart';
import '../../../models/provider/provider/provider_model.dart';
import '../../../models/user_product/user_product_model.dart';
import '../../../models/user_product_cart/user_product_cart_model.dart';

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
          .collection('video_catalog_private')
          // .orderBy('createdAt', descending: true)
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
          .collection('video_catalogs')
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

  Stream<List<OrderModel>> getListOrders() async* {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('orders')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => OrderModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<RequestOrderModel>> getListRequestOrders() async* {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('requestOrders')
          .where('createdByUserId', isEqualTo: uid)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => RequestOrderModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<ProviderModel>> getProviersFromFirebase() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('providers')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProviderModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<UserProductCartModel>> getUserCart() async* {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_cart')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => UserProductCartModel.fromDocument(doc))
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
        // 'createdAt': DateTime.now(),
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
    VideoPostModel? videoPostModel,
    required String catalogName,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String email = userData['email'] ?? '';

    String id = Uuid().v4();

    String imageUrl = '';
    List<dynamic> listVideos = [];

    if (videoPostModel != null) {
      imageUrl = videoPostModel.product!.thumbnail ?? '';
      listVideos.add(videoPostModel.toDocument());
    }

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_catalogs')
          .doc(id)
          .set({
        'id': id,
        'name': catalogName,
        'imageUrl': imageUrl,
        'videos': listVideos,
        'createdBy': email,
        'createdByUserId': uid,
        'createdAt': DateTime.now(),
      });

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> createOrderRequest({
    List<VideoPostModel>? listVideoPostModel,
    VideoPostModel? videoPostModel,
    String? catalogId,
    required String type,
    required String title,
    required String id,
    required String imageUrl,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String email = userData['email'] ?? '';

    List<dynamic> listVideos = [];

    if (listVideoPostModel != null) {
      if (listVideoPostModel.isNotEmpty) {
        for (VideoPostModel videoPostModel in listVideoPostModel) {
          listVideos.add(videoPostModel.toDocument());
        }
      }
    }
    try {
      await _firebaseFirestore.collection('requestOrders').doc(id).set({
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
        'videos': listVideos,
        'video': videoPostModel?.toDocument(),
        'catalogId': catalogId,
        'type': type,
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
    required String imageUrl,
    required List<dynamic> videos,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_catalogs')
          .doc(catalogId)
          .update({
        'videos': videos,
        'imageUrl': imageUrl,
      });

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> deleteCatalog({
    required String catalogId,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_catalogs')
          .doc(catalogId)
          .delete();

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> addToCart({
    required VideoPostModel video,
    required int quantity,
    required int stock,
    required String providerId,
    required double price,
    required double suggestedPrice,
    required int points,
    required String variantID,
    dynamic variantInfo,
    Map<String, dynamic>? attributes,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String email = userData['email'] ?? '';
    String id = Uuid().v4();

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_cart')
          .doc(id)
          .set({
        'id': id,
        'video': video.toDocument(),
        'variantID': variantID,
        'variantInfo': variantInfo,
        'providerId': providerId,
        'quantity': quantity,
        'stock': stock,
        'price': price,
        'suggestedPrice': suggestedPrice,
        'points': points,
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
    required UserProductCartModel cart,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    String cartId = cart.id;
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_cart')
          .doc(cartId)
          .delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> updateVariantFromCart({
    required String cartId,
    required String variantID,
    required dynamic variantInfo,
    required int points,
    required int stock,
    required int quantity,
    required double price,
    required double suggestedPrice,
  }) async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_cart')
          .doc(cartId)
          .update({
        'variantID': variantID,
        'variantInfo': variantInfo,
        'points': points,
        'stock': stock,
        'price': price,
        'suggestedPrice': suggestedPrice,
        'quantity': quantity,
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> clearCart() async {
    Map<String, String> userData = getUidAndEmail();
    String uid = userData['uid'] ?? '';

    try {
      // Obtén todos los documentos de la colección
      QuerySnapshot snapshot = await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('video_cart')
          .get();

      // Elimina cada documento de la colección
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }
}
