import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CurrencyHelpers {
  static String moneyFormat({
    required double amount,
    bool withDecimals = true,
    bool decimalIn0 = true,
    bool withFlag = false,
    bool transformNegative = false,
  }) {
    if (transformNegative) {
      if (amount < 0) {
        amount = amount * -1;
      }
    }
    var oCcy = NumberFormat("#,##0", "en_US");

    if (withDecimals) {
      oCcy = NumberFormat("#,##0.00", "en_US");
    }

    String moneda = oCcy.format(double.parse(amount.toString()));
    moneda = moneda.replaceAll('.', ':');

    if (!decimalIn0) {
      moneda = moneda.replaceAll(':00', '');
    }

    moneda = moneda.replaceAll(',', '.');
    moneda = moneda.replaceAll(':', ',');

    return '\$$moneda';
  }
}
