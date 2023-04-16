import '../Models/Utilidades/conversiones.dart';
import '../Models/anualidad_diferida.dart';
import '../Models/interes_compuesto.dart';

void main(List<String> arguments) {
  print("-----Utils/Conversiones.dart------");
  //Caso de ejemplo Conversiones.convertInterest
  double conver = Conversiones.convertInterest("12", 5.5, "EM");
  print('La tasa convertida es: ${conver.toString()}');
  //Caso de ejemplo Conversiones.convertInterestT
  double tasaInicial = 0.05;
  String monedaOrigen = 'NM';
  String monedaDestino = 'NT';
  double tasaConvertida =
      Conversiones.convertInterestT(tasaInicial, monedaOrigen, monedaDestino);
  print('La tasa inicial de $monedaOrigen es: $tasaInicial');
  print('La tasa convertida a $monedaDestino es: $tasaConvertida');

  //Anualidad_Diferida
  print("-----Anualidad diferida------");
  double valor = 10000;
  double interes = 5.5;
  double tiempo = 5;
  double tgracia = 1;
  double vp = 0;
  String valorPresente = AnualidadDiferida.calcularAnualidadPresente(
      valor, interes, tiempo, tgracia, vp);
  double cuota = AnualidadDiferida.valorCuota(50000, 5, 3, 0.5, 48000);
  print("El valor de la cuota es: $cuota");
  print("El valor presente es: $valorPresente");

  //interes_compuesto
  print("-----Interes compuesto------");
  print(InteresCompuesto.calcularInteresCompuesto(
      1000, 5, 12, "te1", "tn", "anual", 0));
}
