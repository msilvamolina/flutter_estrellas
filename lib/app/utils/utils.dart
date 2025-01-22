import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  Utils._();
  static String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMMM yyyy', 'es').format(dateTime);
    return formattedDate;
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static String generateRandomCode() {
    int length = 6;
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random random = Random();

    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  static Color getColor(String originalColor) {
    try {
      String color = originalColor.replaceAll('#', '');
      if (color.length == 6) {
        color = '0xff${color}';
      }
      var myInt = int.parse(color.toString());
      Color transformado = Color(myInt).withOpacity(1.0);
      return transformado;
    } catch (e) {
      return Colors.grey;
    }
  }
}
