import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_estrellas/app/data/models/product_image/product_image_model.dart';
import 'package:get/instance_manager.dart';

import '../../../../services/api_services.dart';
import '../../../models/product/product_firebase/product_firebase_model.dart';
import '../../../models/product_variant/product_variant_model.dart';
import '../../../models/product_variant_attributes/product_variant_attributes.dart';
import '../../../models/product_variant_combination/product_variant_combination_model.dart';
import '../../../models/variant_attributte/variant_attributte.dart';
import '../../../models/variant_info/variant_info.dart';
import '../../../models/variant_variant/variant_variant.dart';

class ProductsRepository {
  ApiServices services = ApiServices();
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Future<ProductFirebaseModel?> getProduct({required String productId}) async {
    try {
      DocumentSnapshot doc =
          await _firebaseFirestore.collection('products').doc(productId).get();

      if (doc.exists) {
        return ProductFirebaseModel.fromDocument(doc);
      }
      return null; // El documento no existe
    } catch (e) {
      print(e);
      return null; // En caso de error, también retornamos null
    }
  }

  Future<List<ProductVariantModel>> getAllProductVariantsFuture({
    required String productId,
  }) async {
    try {
      // Obtén el snapshot de una sola vez
      QuerySnapshot snapshot = await _firebaseFirestore
          .collection('products/$productId/variants')
          .get();

      // Transforma los documentos del snapshot en una lista de ProductVariantModel
      return snapshot.docs
          .map((doc) => ProductVariantModel.fromDocument(doc))
          .toList();
    } catch (e) {
      print(e);
      // Retorna una lista vacía o lanza la excepción, según lo que prefieras
      return [];
    }
  }

  Future<List<ProductVariantAttributesModel>>
      getAllProductVariantAttributesFuture({
    required String productId,
  }) async {
    try {
      // Obtén el snapshot de una sola vez
      QuerySnapshot snapshot = await _firebaseFirestore
          .collection('products/$productId/attributes')
          .get();

      // Transforma los documentos del snapshot en una lista de ProductVariantAttributesModel
      return snapshot.docs
          .map((doc) => ProductVariantAttributesModel.fromDocument(doc))
          .toList();
    } catch (e) {
      print(e);
      // Retorna una lista vacía o lanza la excepción según lo que prefieras
      return [];
    }
  }

  Future<VariantInfoModel?> getVariantsInfo(String productId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variantsInfo')
          .doc('variantsInfo')
          .get();

      if (!snapshot.exists || snapshot.data() == null) {
        throw Exception("El documento no existe o está vacío.");
      }

      final data = snapshot.data()!;

      List<VariantAttributeModel> attributes =
          (data['attributes'] as List<dynamic>)
              .map((json) =>
                  VariantAttributeModel.fromJson(json as Map<String, dynamic>))
              .toList();

      List<VariantVariantModel> variants = (data['variants'] as List<dynamic>)
          .map((json) =>
              VariantVariantModel.fromJson(json as Map<String, dynamic>))
          .toList();

      VariantInfoModel variantInfoModel =
          VariantInfoModel(attributes: attributes, variants: variants);
      return variantInfoModel;
    } catch (e) {
      print('Error al obtener datos de Firebase: $e');
      return null;
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

  Stream<List<ProductVariantAttributesModel>> getAllProductVariantAttributes(
      {required String productId}) async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products/$productId/attributes')
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductVariantAttributesModel.fromDocument(doc))
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
