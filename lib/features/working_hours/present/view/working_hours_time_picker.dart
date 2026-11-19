import 'package:flutter/material.dart';

/// يعرض منتقي الوقت ويعيد الدقائق المختارة منذ منتصف الليل.
Future<int?> pickWorkingHoursTime({
  required BuildContext context,
  required int initialMinutes,
  required String helpText,
}) async {
  final picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay(
      hour: (initialMinutes ~/ 60) % 24,
      minute: initialMinutes % 60,
    ),
    helpText: helpText,
    cancelText: 'إلغاء',
    confirmText: 'تأكيد',
  );
  if (picked == null) return null;
  return picked.hour * 60 + picked.minute;
}
