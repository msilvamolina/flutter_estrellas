import 'package:flutter/material.dart';

class PaymentsTypesModel {
  PaymentsTypesModel({
    required this.id,
    required this.title,
    this.image,
    this.icon,
  });

  String id;
  String title;
  String? image;
  IconData? icon;
}
