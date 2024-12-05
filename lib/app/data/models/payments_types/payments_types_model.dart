import 'package:flutter/material.dart';

class PaymentsTypesModel {
  PaymentsTypesModel({
    required this.id,
    required this.title,
    required this.paymentMethod,
    this.subtitle,
    this.image,
    this.icon,
  });

  String id;
  String title;
  String? subtitle;
  String? image;
  IconData? icon;
  PaymentMethod paymentMethod;
}

enum PaymentMethod {
  delivery('delivery'),
  bancolombia('bancolombia'),
  pse('pse'),
  card('card');

  const PaymentMethod(this.text);
  final String text;
}
