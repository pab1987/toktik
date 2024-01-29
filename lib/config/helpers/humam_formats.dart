import 'package:intl/intl.dart';

class HumanFormats {
  //Instalamos el paquete <<intl>> para dar formato desde pubspec assits
  static String humanReadbleNumber(double number) {

    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: ''
    ).format( number );
    return formatterNumber;
  }
}