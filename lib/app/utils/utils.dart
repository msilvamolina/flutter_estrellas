import 'dart:math';
import 'package:intl/intl.dart';

class Utils {
  Utils._();
  static String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMMM yyyy', 'es').format(dateTime);
    return formattedDate;
  }

  static String generateRandomCode() {
    int length = 6;
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random random = Random();

    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
