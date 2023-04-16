import 'dart:math';

class InteresCompuesto {
  static String calcularInteresCompuesto(
      double valorP,
      double tasa,
      double tiempoCompuesto,
      String te,
      String tn,
      String tiempo,
      double monto) {
    if (valorP != 0 && monto == 0) {
      return vmonto(valorP, tasa, tiempoCompuesto, te, tn, tiempo);
    } else {
      if (monto != 0 && valorP == 0) {
        return vcapital(monto, tasa, tiempoCompuesto, te, tn, tiempo);
      } else {
        if (monto != 0 && valorP != 0) {
          return ("Elija entre uno, monto o valor");
        }
        if (monto == 0 && valorP == 0) {
          return ("Ingrese valores entre monto o valor");
        }
      }
    }
    return "Error de validación";
  }

  static String vmonto(double valorP, double tasa, double tiempoCompuesto,
      String te, String tn, String tiempo) {
    if (tasa < 0 || tiempoCompuesto < 0) {
      return ("No se aceptan valores negativos");
    } else if (tasa == 0 || tiempoCompuesto == 0) {
      return ("Ingrese todos los valores");
    } else {
      if (te == "te" && tn == "tn") {
        return ("Ingrese todos los valores (te y tn)");
      } else {
        if (te != "te" && tn != "tn") {
          return ("Elija solo un tipo de interes");
        } else {
          if (tiempo == "tiempo") {
            return ("Elija tiempo");
          } else {
            num tasaMultiplicar = 1;
            if (te != "te") {
              String t = te[1];
              if (t == tiempo) {
                tasaMultiplicar = pow(1 + tasa / 100, tiempoCompuesto);
              } else {
                tiempoCompuesto =
                    convertTiempoCompuesto(t, tiempoCompuesto, tiempo);
                tasaMultiplicar = pow(1 + tasa / 100, tiempoCompuesto);
              }
            }
            if (tn != "tn") {
              String t = tn[1];
              convertNominaltoEfectiva(t, tasa);
              if (t == tiempo) {
                tasaMultiplicar = pow(1 + tasa / 100, tiempoCompuesto);
              } else {
                tiempoCompuesto =
                    convertTiempoCompuesto(t, tiempoCompuesto, tiempo);
                print(tiempoCompuesto);
                tasaMultiplicar = pow(1 + tasa / 100, tiempoCompuesto);
              }
            }
            double resultado = valorP * tasaMultiplicar;
            return "El monto es \$ ${resultado.toStringAsFixed(3)}";
          }
        }
      }
    }
  }

  static String vcapital(double monto, double tasa, double tiempoCompuesto,
      String te, String tn, String tiempo) {
    if (tasa < 0 || tiempoCompuesto < 0) {
      return ("No se aceptan valores negativos");
    } else if (tasa == 0 || tiempoCompuesto == 0) {
      return ("Ingrese todos los valores");
    } else {
      if (te == "te" && tn == "tn") {
        return ("Ingrese todos los valores");
      } else {
        if (te != "te" && tn != "tn") {
          return ("Elija solo un tipo de interés (te o tn)");
        } else {
          if (tiempo == "tiempo") {
            return ("Elija tiempo");
          } else {
            num tasaMultiplicar = 1;
            if (te != "te") {
              String t = te[1];
              if (t == tiempo) {
                tasaMultiplicar = pow(1 + tasa / 100, tiempoCompuesto);
              } else {
                tiempoCompuesto =
                    convertTiempoCompuesto(t, tiempoCompuesto, tiempo);
                tasaMultiplicar = pow(1 + tasa / 100, tiempoCompuesto);
              }
            }
            if (tn != "tn") {
              String t = tn[1];
              convertNominaltoEfectiva(t, tasa);
              if (t == tiempo) {
                tasaMultiplicar = pow(1 + tasa / 100, tiempoCompuesto);
              } else {
                tiempoCompuesto =
                    convertTiempoCompuesto(t, tiempoCompuesto, tiempo);
                print(tiempoCompuesto);
                tasaMultiplicar = pow(1 + tasa / 100, tiempoCompuesto);
              }
            }
            double resultado = monto / tasaMultiplicar;
            return "El capital es \$ ${resultado.toStringAsFixed(3)}";
          }
        }
      }
    }
  }

  static double convertNominaltoEfectiva(String t, double tasa) {
    switch (t) {
      case "m":
        return tasa / 12;
      case "b":
        return tasa / 6;
      case "t":
        return tasa / 4;
      case "c":
        return tasa / 3;
      case "s":
        return tasa / 2;
      default:
        throw ArgumentError("El valor de 't' no es válido.");
    }
  }

  static double convertTiempoCompuesto(String t, double tc, String tiempo) {
    if (t == "m") {
      if (tiempo == "b") return tc * 2;
      if (tiempo == "t") return tc * 3;
      if (tiempo == "c") return tc * 4;
      if (tiempo == "s") return tc * 6;
      if (tiempo == "a") return tc * 12;
    }
    if (t == "b") {
      if (tiempo == "m") return tc / 2;
      if (tiempo == "t") return tc * 3 / 2;
      if (tiempo == "c") return tc * 2;
      if (tiempo == "s") return tc * 3;
      if (tiempo == "a") return tc * 6;
    }
    if (t == "t") {
      if (tiempo == "m") return tc / 3;
      if (tiempo == "b") return tc * 2 / 3;
      if (tiempo == "c") return tc * 4 / 3;
      if (tiempo == "s") return tc * 2;
      if (tiempo == "a") return tc * 4;
    }
    if (t == "c") {
      if (tiempo == "m") return tc / 4;
      if (tiempo == "b") return tc * 2 / 4;
      if (tiempo == "t") return tc * 3 / 4;
      if (tiempo == "s") return tc * 4 / 3;
      if (tiempo == "a") return tc * 3;
    }
    if (t == "s") {
      if (tiempo == "m") return tc / 6;
      if (tiempo == "b") return tc * 2 / 6;
      if (tiempo == "t") return tc * 3 / 6;
      if (tiempo == "c") return tc * 3 / 4;
      if (tiempo == "a") return tc * 2;
    }
    if (t == "a") {
      if (tiempo == "m") return tc / 12;
      if (tiempo == "b") return tc * 2 / 12;
      if (tiempo == "t") return tc * 3 / 12;
      if (tiempo == "c") return tc * 1 / 3;
      if (tiempo == "s") return tc / 2;
    }
    return -1;
  }
}
