import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/friendly_helpers.dart';
import '../../helpers/model_helpers.dart';
import '../phone/phone_model.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
abstract class UserData implements _$UserData {
  const UserData._();

  const factory UserData({
    required String uid,
    required String fullName,
    required String email,
    required String document,
    PhoneModel? phone,
    String? imageUrl,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  factory UserData.fromDocument(DocumentSnapshot doc) {
    UserData data = UserData.fromJson(ModelHelpers.fromDocument(doc.data()!));
    return data;
  }

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
