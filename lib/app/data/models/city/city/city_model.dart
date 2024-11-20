import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helpers/model_helpers.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
abstract class CityModel implements _$CityModel {
  const CityModel._();

  const factory CityModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'dropi_id') int? dropiId,
    @JsonKey(name: 'department_id') int? departmenId,
    @JsonKey(name: 'cod_dane') String? codeDane,
    @JsonKey(name: 'name') String? name,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  factory CityModel.fromDocument(DocumentSnapshot doc) =>
      CityModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
