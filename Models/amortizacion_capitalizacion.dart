import 'package:flutter/material.dart';
import 'Utilidades/conversiones.dart';

class Amortizacion {
  String modalidadPago = "";
  String modalidadInteres = "";
  double interes = 0;
  Amortizacion(this.modalidadPago, this.modalidadInteres, this.interes);

  Widget createTableAmortizacion(
      double valorDeuda, int numPagos, double cuota, double realInterest) {
    realInterest =
        Conversiones.convertInterest(modalidadPago, interes, modalidadInteres);
    cuota = Conversiones.calculateFee(valorDeuda, realInterest, numPagos);
    int periodo = 0;
    double saldo = valorDeuda;
    double valorInteres = 0;
    double valorCuota = cuota;
    double amortizacion = 0;
    List<DataRow> rows = [];
    rows.add(DataRow(cells: [
      DataCell(Text('Periodo')),
      DataCell(Text('Saldo')),
      DataCell(Text('Interes')),
      DataCell(Text('Cuota')),
      DataCell(Text('Amortizacion'))
    ]));
    while (periodo <= numPagos) {
      rows.add(DataRow(cells: [
        DataCell(Text(periodo.toString())),
        DataCell(Text(saldo.toStringAsFixed(2))),
        DataCell(Text(valorInteres.toStringAsFixed(2))),
        DataCell(Text(valorCuota.toStringAsFixed(2))),
        DataCell(Text(amortizacion.toStringAsFixed(2)))
      ]));
      valorInteres = saldo * realInterest;
      if (saldo < valorCuota) {
        valorCuota = saldo + valorInteres;
      } else if (periodo == 0) {
        valorCuota = cuota;
      }
      amortizacion = valorCuota - valorInteres;
      saldo -= amortizacion;
      periodo++;
    }
    return DataTable(columns: [
      DataColumn(label: Text('Periodo')),
      DataColumn(label: Text('Saldo')),
      DataColumn(label: Text('Interes')),
      DataColumn(label: Text('Cuota')),
      DataColumn(label: Text('Amortizacion'))
    ], rows: rows);
  }

  Widget createTableCapitalization(double valorCapitalizable, int numPagos,
      double cuota, double realInterest) {
    realInterest =
        Conversiones.convertInterest(modalidadPago, interes, modalidadInteres);
    cuota =
        Conversiones.calculateFee(valorCapitalizable, realInterest, numPagos);
    int periodo = 1;
    double saldo = cuota;
    double valorInteres = 0;
    double valorCuota = cuota;
    double incremento = cuota;
    List<DataRow> rows = [];
    rows.add(DataRow(cells: [
      DataCell(Text('Periodo')),
      DataCell(Text('Saldo')),
      DataCell(Text('Interes')),
      DataCell(Text('Cuota')),
      DataCell(Text('Incremento'))
    ]));

    while (saldo <= valorCapitalizable) {
      rows.add(DataRow(cells: [
        DataCell(Text(periodo.toString())),
        DataCell(Text(saldo.toStringAsFixed(2))),
        DataCell(Text(valorInteres.toStringAsFixed(2))),
        DataCell(Text(valorCuota.toStringAsFixed(2))),
        DataCell(Text(incremento.toStringAsFixed(2)))
      ]));

      valorInteres = saldo * realInterest;

      if (saldo < valorCuota) {
        valorCuota = saldo + valorInteres;
      } else if (periodo == 0) {
        valorCuota = cuota;
      }

      incremento = valorCuota + valorInteres;
      saldo += incremento;
      periodo++;
    }

    return DataTable(columns: [
      DataColumn(label: Text('Periodo')),
      DataColumn(label: Text('Saldo')),
      DataColumn(label: Text('Interes')),
      DataColumn(label: Text('Cuota')),
      DataColumn(label: Text('Incremento'))
    ], rows: rows);
  }
}
