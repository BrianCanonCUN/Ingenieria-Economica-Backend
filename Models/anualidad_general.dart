import 'dart:math';
import 'package:intl/intl.dart';

class AnualidadGeneral {
  static String calcularAnualidadFuturo(
      double valor, double interes, double tiempo, double vf) {
    if (valor != 0 && vf == 0) {
      return valorFuturo(valor, interes, tiempo);
    } else if (valor == 0 && vf != 0) {
      return valorCuotaFuturo(valor, interes, tiempo, vf);
    } else if (valor < 0 || interes < 0 || tiempo < 0 || vf < 0) {
      return 'Ingrese solo valores positivos';
    } else if (valor == 0 || interes == 0 || tiempo == 0) {
      return 'ingrese todos los valores';
    } else if (valor != 0 && vf != 0) {
      return 'Ingrese solo un valor (No se puede tener el valor presente y el valor futuro al tiempo)';
    }
    return "Error de validaciones";
  }

  static String valorFuturo(
      double valorCuotaF, double interesF, double tiempoF) {
    double inte = interesF / 100;
    var tasa = pow((1 + inte), tiempoF);
    double result = valorCuotaF * ((tasa - 1) / inte);
    return result.toStringAsFixed(3);
  }

  static String valorCuotaFuturo(
      double valorcuotaf, double interesf, double tiempof, double vf) {
    double inte = interesf / 100;
    var tasa = pow((1 + inte), tiempof);
    double result = vf / ((tasa - 1) / inte);
    return NumberFormat.currency(locale: 'es-CP', decimalDigits: 3)
        .format(result);
  }

  static String calcularAnualidadPresente(
      double valor, double interes, double tiempo, double vp) {
    if (valor == 0 && vp != 0) {
      return valorCuota(valor, interes, tiempo, vp);
    } else if (valor != 0 && vp == 0) {
      double inte = interes / 100;
      double auxtime = -1 * tiempo;
      var tasa = pow((1 + inte), auxtime);
      var result = valor * ((1 - tasa) / inte);
      return 'Valor Presente \$ ${result.toStringAsFixed(3)}';
    } else if (valor == 0 || interes == 0 || tiempo == 0) {
      return ('Ingrese todos los valores');
    } else if (valor < 0 || interes < 0 || tiempo < 0 || vp < 0) {
      return ('Ingrese solo valores positivos');
    } else if (valor != 0 && vp != 0) {
      return ('Debe ingresar un solo valor no ambos (valor presente o el valor)');
    }
    return "Error de validación";
  }

  static String valorCuota(
      double valor, double interes, double tiempo, double vp) {
    double inte = interes / 100;
    var auxtime = -1 * tiempo;
    var tasa = pow((1 + inte), auxtime);
    double result = vp / ((1 - tasa) / inte);
    print('$tasa, $result');
    return NumberFormat.currency(locale: 'es-CP', decimalDigits: 3)
        .format(result);
  }
}
