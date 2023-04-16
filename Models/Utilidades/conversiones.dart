import 'utils.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class Conversiones {
  static double convertInterest(
      String modalidadPago, double i, String modalidadInteres) {
    // Busca la modalidad de interes en la lista de j
    var val =
        Utils.interestJ.where((k) => k['name'] == modalidadInteres).toList();
    i /= 100;
    // Si la modalidad de interes esta en j
    if (val.isNotEmpty) {
      i /= val[0]['value'];
    } else {
      // Busca la modalidad de interes en la lista de i
      val =
          Utils.interestI.where((k) => k['name'] == modalidadInteres).toList();
    }
    int valueI = val[0]['value'];
    // Valida si no están en el mismo periodo de tiempo el pago y el interes, si es asi, los convierte al mismo periodo de tiempo
    if (modalidadPago != valueI.toString()) {
      int n = valueI.toInt();
      int m = int.parse(modalidadPago);
      var value = pow(1 + i, n);
      i = pow(value, 1 / m) - 1;
    }
    return i;
  }

  static double convertInterestT(double i, String o, String d) {
    var origen = Utils.interestI.where((k) => k['name'] == o);
    var destinoOriginal = Utils.interestI.where((k) => k['name'] == d);
    var destino = Utils.interestI.where((k) => k['name'] == d);
    i /= 100;
    if (o != d) {
      // Valida si origen es j y destino es i
      if (origen.isEmpty && destino.isNotEmpty) {
        origen = Utils.interestJ.where((k) => k['name'] == o);
        i /= origen.elementAt(0)['value'];
        print(
            "Origen es j: ${origen.elementAt(0)}, Destino es i: ${destino.elementAt(0)}");
      }
      if (origen.isEmpty) {
        origen = Utils.interestJ.where((k) => k['name'] == o);
        print("Origen es j: ${origen.elementAt(0)['value']}");
      }
      if (destino.isEmpty) {
        destino = Utils.interestJ.where((k) => k['name'] == d);
        print("Destino es j: ${destino.elementAt(0)}");
      }

      // Valida si no están en el mismo periodo de tiempo el origen y el destino, si es asi, los convierte al mismo periodo de tiempo
      if (origen.elementAt(0)['value'] != destino.elementAt(0)['value']) {
        final n = origen.elementAt(0)['value'];
        final m = destino.elementAt(0)['value'];
        var value = pow(1 + i, n);
        i = pow(value, 1 / m) - 1;
        print("Conversión de tasas: ${origen.elementAt(0)}");
      }

      // Valida si origen es i y destino es j
      if (origen.isNotEmpty && destinoOriginal.isEmpty) {
        final destinoJ = Utils.interestJ.where((k) => k['name'] == d);
        i *= destinoJ.elementAt(0)['value'];
        print(
            "Se convierte a j\nOrigen es i: ${origen.elementAt(0)}, Destino es j: ${destino.elementAt(0)}");
      }

      i *= 100;
      return double.parse(i.toStringAsFixed(2));
    } else {
      i *= 100;
      return double.parse(i.toStringAsFixed(2));
    }
  }

  static double calculateFee(double p, double i, int n) {
    double bottomPart = (1 - pow(1 + i, n * -1)) / i;
    double a = p / bottomPart;

    return double.parse(a.toStringAsFixed(3));
  }

  static double calculateFeeFuture(double p, double i, int n) {
    double bottomPart = (pow(1 + i, n) - 1) / i;
    double a = p / bottomPart;

    return double.parse(a.toStringAsFixed(3));
  }

  static String convertNumber(double value) {
    return NumberFormat.currency(locale: 'es-CO', symbol: 'COP').format(value);
  }
}
