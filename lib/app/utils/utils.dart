import 'dart:math';

class Utils {
  Utils._();

  static String generateRandomCode() {
    int length = 6;
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random random = Random();

    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
