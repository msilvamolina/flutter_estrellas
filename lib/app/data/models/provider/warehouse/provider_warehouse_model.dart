import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_warehouse_model.freezed.dart';
part 'provider_warehouse_model.g.dart';

@freezed
abstract class ProviderWarehouseModel with _$ProviderWarehouseModel {
  const factory ProviderWarehouseModel({
    @JsonKey(name: '_id') required String id,
    String? name,
    String? phone,
    String? city,
    String? address,
    String? externalID,
  }) = _ProviderWarehouseModel;

  factory ProviderWarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderWarehouseModelFromJson(json);
}
