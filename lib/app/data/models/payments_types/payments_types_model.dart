import 'package:flutter/material.dart';

class PaymentsTypesModel {
  PaymentsTypesModel({
    required this.id,
    required this.title,
    required this.paymentMethod,
    this.subtitle,
    this.image,
    this.icon,
    this.disabled = false,
  });

  String id;
  String title;
  String? subtitle;
  String? image;
  IconData? icon;
  PaymentMethod paymentMethod;
  bool disabled;
}

enum PaymentMethod {
  delivery('delivery'),
  bancolombia('bancolombia'),
  pse('pse'),
  card('card');

  const PaymentMethod(this.text);
  final String text;
}
