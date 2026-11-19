import 'package:flutter/services.dart';

// Eastern Arabic-Indic (٠-٩) and Persian (۰-۹) numerals start at these code
// points and run in order, so an offset maps each one onto an ASCII digit.
const int _arabicIndicFirst = 0x0660;
const int _arabicIndicLast = 0x0669;
const int _extendedArabicIndicFirst = 0x06F0;
const int _extendedArabicIndicLast = 0x06F9;
const int _asciiZero = 0x30;
const int _arabicDecimalSeparator = 0x066B;
const int _arabicThousandsSeparator = 0x066C;

/// Rewrites numerals into ASCII digits: Arabic-Indic ٠-٩ and Persian ۰-۹ become
/// 0-9, the Arabic decimal separator (٫) becomes '.', and the Arabic thousands
/// separator (٬) is dropped.
String normalizeDigits(String input) {
  final buffer = StringBuffer();
  for (final rune in input.runes) {
    if (rune >= _arabicIndicFirst && rune <= _arabicIndicLast) {
      buffer.writeCharCode(rune - _arabicIndicFirst + _asciiZero);
    } else if (rune >= _extendedArabicIndicFirst &&
        rune <= _extendedArabicIndicLast) {
      buffer.writeCharCode(rune - _extendedArabicIndicFirst + _asciiZero);
    } else if (rune == _arabicDecimalSeparator) {
      buffer.write('.');
    } else if (rune != _arabicThousandsSeparator) {
      buffer.writeCharCode(rune);
    }
  }
  return buffer.toString();
}

/// The text stored for a price: ASCII digits with at most one '.', and no
/// grouping characters or whitespace.
String normalizePrice(String raw) =>
    normalizeDigits(raw).replaceAll(RegExp(r'[,\s_]'), '').trim();

/// The price as a number, or null when [raw] is empty or not a price.
double? parsePrice(String raw) {
  if (raw.trim().isEmpty) return null;
  final normalized = normalizePrice(raw);
  if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(normalized)) return null;
  return double.tryParse(normalized);
}

/// Upper bound for a menu price, so a mistyped number cannot break the menu.
const double maxProductPrice = 1000000;

/// Whether [raw] is a price that can be stored and used for calculations: a
/// positive number with at most two decimals, below [maxProductPrice].
bool isValidPrice(String raw) {
  final price = parsePrice(raw);
  if (price == null || !price.isFinite) return false;
  if (price <= 0 || price > maxProductPrice) return false;
  final cents = price * 100;
  return (cents - cents.roundToDouble()).abs() < 0.000001;
}

/// The value a price is stored as in Firestore: a number, and an int whenever
/// there is no fraction so documents stay readable (120 rather than 120.0).
/// Null when [raw] is not a valid price.
num? parsePriceNumber(String raw) {
  final price = parsePrice(raw);
  if (price == null) return null;
  final rounded = double.parse(price.toStringAsFixed(2));
  return rounded == rounded.roundToDouble() ? rounded.toInt() : rounded;
}

/// Price text for a stored value. Current documents hold a number, while older
/// ones hold a string that may use Arabic-Indic digits.
String priceToText(Object? value) {
  if (value is num) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toString();
  }
  if (value == null) return '';
  return normalizePrice(value.toString());
}

/// Normalizes numerals as they are typed, so Arabic-Indic input lands in the
/// field as the ASCII digits prices are stored with.
class PriceDigitsInputFormatter extends TextInputFormatter {
  const PriceDigitsInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final normalized = normalizeDigits(newValue.text);
    if (normalized == newValue.text) return newValue;
    return TextEditingValue(
      text: normalized,
      selection: newValue.selection,
      composing: TextRange.empty,
    );
  }
}
