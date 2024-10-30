import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_estrellas/app/data/models/product_image/product_image_model.dart';
import 'package:get/instance_manager.dart';

import '../../../../services/api_services.dart';
import '../../../models/product/product_firebase/product_firebase_model.dart';
import '../../../models/product_variant/product_variant_model.dart';
import '../../../models/product_variant_combination/product_variant_combination_model.dart';

class ProductsRepository {
  ApiServices services = ApiServices();
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Stream<ProductFirebaseModel?> getProduct({required String productId}) async* {
    try {
      Stream<DocumentSnapshot> snapshot =
          _firebaseFirestore.collection('products').doc(productId).snapshots();

      yield* snapshot.map((doc) {
        if (doc.exists) {
          return ProductFirebaseModel.fromDocument(doc);
        }
        return null;
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<ProductImageModel>> getProductImages(
      {required String productId}) async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products/$productId/images')
          .orderBy('order', descending: false)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductImageModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<ProductVariantModel>> getAllProductVariants(
      {required String productId}) async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products/$productId/variants')
          .orderBy('order', descending: false)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductVariantModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<ProductVariantCombinationModel>>
      getAllProductVariantsCombinations({required String productId}) async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products/$productId/variants_combinations')
          .orderBy('name', descending: false)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductVariantCombinationModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }
}
