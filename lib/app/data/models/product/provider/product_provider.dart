import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_provider.freezed.dart';
part 'product_provider.g.dart';

@freezed
abstract class ProductProviderModel with _$ProductProviderModel {
  const factory ProductProviderModel({
    @JsonKey(name: '_id') required String id,
    String? name,
    String? avatarUrl,
  }) = _ProductProviderModel;

  factory ProductProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProductProviderModelFromJson(json);
}
