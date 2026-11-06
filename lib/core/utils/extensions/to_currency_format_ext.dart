import 'package:intl/intl.dart';

extension StringToCurrencyFormatExt on String {
  String toCurrencyFormat() {
    final double? value = double.tryParse(this);
    if (value == null) return this;
    return NumberFormat('#,###').format(value);
  }
}
