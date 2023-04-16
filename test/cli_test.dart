import 'package:test/test.dart';

import '../Models/Utilidades/conversiones.dart';

void main() {
  test('convertInterest', () {
    expect(Conversiones.convertInterest("12", 5.5, "EM"), 0.055);
  });
}
