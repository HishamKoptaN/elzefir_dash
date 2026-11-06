import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';

extension CurrencyFormatterExt on TextInputFormatter {
  static TextInputFormatter get baseCurrency {
    return CurrencyTextInputFormatter.currency(
      locale: 'en',
      // ar_SA
      symbol: '',
      decimalDigits: 1,
    );
  }
}
