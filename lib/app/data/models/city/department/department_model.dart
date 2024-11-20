import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helpers/model_helpers.dart';

part 'department_model.freezed.dart';
part 'department_model.g.dart';

@freezed
abstract class DepartmentModel implements _$DepartmentModel {
  const DepartmentModel._();

  const factory DepartmentModel({
    @JsonKey(name: 'dropi_id') required int dropiId,
    required String name,
  }) = _DepartmentModel;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);

  factory DepartmentModel.fromDocument(DocumentSnapshot doc) =>
      DepartmentModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
