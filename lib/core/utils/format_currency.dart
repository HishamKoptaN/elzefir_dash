import 'package:intl/intl.dart';

String formatCurrency({required String value}) {
  final cleanValue = value.replaceAll(',', '');
  final number = double.tryParse(cleanValue) ?? 0;
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}
