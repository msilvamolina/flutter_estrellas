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
      paymentMethod: json['paymentMethod'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      profit: (json['profit'] as num).toDouble(),
      points: (json['points'] as num).toInt(),
      createdAt: json['createdAt'] as String,
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
      'paymentMethod': instance.paymentMethod,
      'type': instance.type,
      'status': instance.status,
      'profit': instance.profit,
      'points': instance.points,
      'createdAt': instance.createdAt,
      'products': instance.products,
    };
