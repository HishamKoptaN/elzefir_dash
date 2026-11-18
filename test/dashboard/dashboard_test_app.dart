import 'package:alzefr_dash/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpDashboard(
  WidgetTester tester,
  Widget child, {
  Size size = const Size(1440, 900),
  double textScale = 1,
  bool settle = true,
}) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = size;
  addTearDown(tester.view.resetDevicePixelRatio);
  addTearDown(tester.view.resetPhysicalSize);
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp(
          theme: AppTheme.lightTheme(context),
          home: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(textScale)),
            child: Directionality(
              textDirection: .rtl,
              child: Scaffold(body: child),
            ),
          ),
        );
      },
    ),
  );
  if (settle) {
    await tester.pumpAndSettle();
  }
}
