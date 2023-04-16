import 'package:intl/intl.dart';

class RentaPerpetua {
  static String mostrarData(double valor, double tasa) {
    final tasaReal = tasa / 100;
    final result = (valor / tasaReal);
    return "\$${NumberFormat.currency(decimalDigits: 3, locale: "es-CP", symbol: "").format(result)}";
  }
}
