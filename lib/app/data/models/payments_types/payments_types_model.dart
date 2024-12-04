import 'package:flutter/material.dart';

class PaymentsTypesModel {
  PaymentsTypesModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.image,
    this.icon,
  });

  String id;
  String title;
  String? subtitle;
  String? image;
  IconData? icon;
}
