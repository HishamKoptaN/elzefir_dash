import 'package:alzefr_dash/features/products/present/view/widgets/list/products_search_field.dart';
import 'package:alzefr_dash/features/working_hours/domain/working_hours.dart';
import 'package:alzefr_dash/features/working_hours/present/widgets/days/working_day_chip.dart';
import 'package:alzefr_dash/features/working_hours/present/widgets/days/working_days_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dashboard_test_app.dart';

void main() {
  for (final size in [
    const Size(320, 690),
    const Size(800, 1024),
    const Size(1440, 900),
  ]) {
    testWidgets('search hint remains compact at $size', (tester) async {
      await pumpDashboard(
        tester,
        ProductsSearchField(onChanged: (_) {}),
        size: size,
      );
      final field = tester.widget<TextField>(find.byType(TextField));
      expect(field.decoration?.hintStyle?.fontSize, field.style?.fontSize);
      expect(
        tester.getSize(find.byType(TextField)).height,
        inInclusiveRange(48, 80),
      );
      expect(tester.takeException(), isNull);
    });

    for (final scale in [1.0, 2.0]) {
      testWidgets('weekday labels fit at $size with scale $scale', (
        tester,
      ) async {
        int? toggledDay;
        await pumpDashboard(
          tester,
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 728),
              child: WorkingDaysGrid(
                days: const {1},
                onToggleDay: (day) {
                  toggledDay = day;
                },
              ),
            ),
          ),
          size: size,
          textScale: scale,
        );
        for (final label in weekdayNames.values) {
          final finder = find.text(label);
          final paragraph = tester.renderObject<RenderParagraph>(finder);
          final text = tester.widget<Text>(finder);
          expect(paragraph.didExceedMaxLines, isFalse, reason: label);
          expect(
            paragraph.size.height,
            lessThan(text.style!.fontSize! * scale * 2),
          );
        }
        for (final element in find.byType(WorkingDayChip).evaluate()) {
          expect(
            tester.getSize(find.byWidget(element.widget)).height,
            greaterThanOrEqualTo(48),
          );
        }
        await tester.tap(find.text(weekdayNames[1]!));
        expect(toggledDay, 1);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
