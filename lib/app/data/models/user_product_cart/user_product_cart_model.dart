import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_estrellas/app/data/models/product_variant_combination/product_variant_combination_model.dart';
import 'package:flutter_estrellas/app/data/models/videos/video_post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';
import '../product_firebase_lite/product_firebase_lite.dart';

part 'user_product_cart_model.freezed.dart';
part 'user_product_cart_model.g.dart';

@freezed
abstract class UserProductCartModel implements _$UserProductCartModel {
  const UserProductCartModel._();

  const factory UserProductCartModel({
    required String id,
    required double price,
    required double suggestedPrice,
    required String providerId,
    required int points,
    required int stock,
    int? quantity,
    VideoPostModel? video,
    String? variantID,
    dynamic variantInfo,
    // ProductVariantCombinationModel? productCombination,
    String? createdAt,
  }) = _UserProductCartModel;

  factory UserProductCartModel.fromJson(Map<String, dynamic> json) =>
      _$UserProductCartModelFromJson(json);

  factory UserProductCartModel.fromDocument(DocumentSnapshot doc) =>
      UserProductCartModel.fromJson(ModelHelpers.fromDocument(doc.data()!));

  Map<String, dynamic> toDocument() {
    dynamic json = toJson();
    if (video != null) {
      json['video'] = video!.toDocument();
    }

    return json;
  }
}
