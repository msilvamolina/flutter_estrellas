// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      body: json['body'],
      orderData: json['orderData'],
      amount: (json['amount'] as num).toDouble(),
      orderId: json['orderId'] as String,
      paymentMethod: json['paymentMethod'] as String,
      type: json['type'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => UserProductCartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'body': instance.body,
      'orderData': instance.orderData,
      'amount': instance.amount,
      'orderId': instance.orderId,
      'paymentMethod': instance.paymentMethod,
      'type': instance.type,
      'products': instance.products,
    };
