import 'package:alzefr_dash/core/build/app_version.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppVersion.format', () {
    test('يعرض رقم البناء عند وجوده', () {
      expect(AppVersion.format('1.0.0', '1'), '1.0.0+1');
    });

    test('يتجاهل رقم البناء الفارغ', () {
      expect(AppVersion.format('1.0.0', ''), '1.0.0');
    });

    test('لا يعرض نصاً عند غياب الإصدار', () {
      expect(AppVersion.format('', '1'), '');
    });
  });
}
