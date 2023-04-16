import 'dart:math';

class AnualidadDiferida {
  static double valorCuota(
      double valor, double interes, double tiempo, double tgracia, double vp) {
    double inte = interes / 100;
    double auxtime = -1 * tiempo;
    var tasa = pow((1 + inte), auxtime);
    var gracia = pow((1 + inte), -1 * tgracia);
    double result = vp / (((1 - tasa) / inte) * gracia);
    print('el valor de la cuota es $result');
    return result;
  }

  static String calcularAnualidadPresente(
      double valor, double interes, double tiempo, double tgracia, double vp) {
    print('$valor, $interes, $tiempo, $tgracia, $vp, estos son los valores');
    if (valor == 0 && vp != 0) {
      valorCuota(valor, interes, tiempo, tgracia, vp);
    } else if (valor != 0 && vp == 0) {
      var inte = interes / 100;
      var auxtime = -1 * tiempo;
      var tasa = pow((1 + inte), auxtime);
      var gracia = pow((1 + inte), (-1 * tgracia));
      var result = valor * ((1 - tasa) / inte);
      result = result * gracia;
      print('Valor Presente \$ ${result.toStringAsFixed(3)}');
      return result.toStringAsFixed(3);
    } else if (valor == 0 || interes == 0 || tiempo == 0 || tgracia == 0) {
      return "Ingrese todos los valores";
    } else if (valor < 0 ||
        interes < 0 ||
        tiempo < 0 ||
        vp < 0 ||
        tgracia < 0) {
      return "Todos los valores deben ser mayor a 0";
    } else if (valor != 0 && vp != 0) {
      return "Debe ingresar solo el valor o el valor presente no los dos";
    }
    return "Error de validaciones";
  }
}
