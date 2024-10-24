import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/friendly_helpers.dart';
import '../../helpers/model_helpers.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
abstract class UserData implements _$UserData {
  const UserData._();

  const factory UserData({
    required String uid,
    required String email,
    required String username,
    required String firstName,
    required String lastName,
    required String createdAt,
    required String createdBy,
    String? searchField,
    dynamic reference,
    String? defaultCurrency,
    Map<String, dynamic>? currencies,
    @Default(false) bool isAnonymous,
    String? updatedAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  factory UserData.fromDocument(DocumentSnapshot doc) {
    UserData data = UserData.fromJson(ModelHelpers.fromDocument(doc.data()!));
    String searchField = '${data.firstName} ${data.lastName} ${data.username}';

    return data.copyWith(
      reference: doc.reference,
      searchField: FriendlyHelpers.friendlySearchField(searchField),
    );
  }

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
