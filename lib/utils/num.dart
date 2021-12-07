import 'package:intl/intl.dart';

String doubleFormat(double number) {
  final format = NumberFormat("#,###.#", "en_US");
  format.minimumFractionDigits = 0;
  format.maximumFractionDigits = 2;
  return format.format(number);
}