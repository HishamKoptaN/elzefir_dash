import 'package:intl/intl.dart';

/// Formats a price for display: thousands separators, and at most two decimals
/// so a whole price stays whole ("120") while 120.5 keeps its fraction.
String formatCurrency({required String value}) {
  final cleanValue = value.replaceAll(',', '').trim();
  final number = double.tryParse(cleanValue);
  if (number == null) return cleanValue;
  return NumberFormat('#,##0.##').format(number);
}
