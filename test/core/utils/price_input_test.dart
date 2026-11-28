import 'package:alzefr_dash/core/utils/price_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('normalizeDigits', () {
    test('يحوّل الأرقام العربية والفارسية إلى ASCII', () {
      expect(normalizeDigits('١٢٣ ۴۵۶'), '123 456');
    });

    test('يحوّل الفاصلة العربية ويحذف فاصل الآلاف', () {
      expect(normalizeDigits('١٬٢٣٤٫٥'), '1234.5');
    });
  });

  group('parsePrice', () {
    test('يقرأ السعر بعد التطبيع', () {
      expect(parsePrice(' ١٢٥٫٥ '), 125.5);
      expect(parsePrice('1,000'), 1000.0);
      expect(parsePrice(''), isNull);
    });

    test('isValidPrice يرفض القيم غير الصحيحة', () {
      expect(isValidPrice('125.50'), isTrue);
      expect(isValidPrice('0'), isFalse);
      expect(isValidPrice('125.555'), isFalse);
      expect(isValidPrice('1000001'), isFalse);
    });
  });

  group('parsePriceNumber و priceToText', () {
    test('يخزّن الأعداد الصحيحة كـ int والنواقص كـ double', () {
      expect(parsePriceNumber('١٢٠'), 120);
      expect(parsePriceNumber('120.50'), 120.5);
    });

    test('نص العرض يتعامل مع الحقول القديمة والجديدة', () {
      expect(priceToText(120.0), '120');
      expect(priceToText(120.5), '120.5');
      expect(priceToText('١٢٠'), '120');
      expect(priceToText(null), '');
    });
  });
}
