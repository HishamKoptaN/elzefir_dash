import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/working_hours_controller.dart';
import 'working_hours_widgets.dart';

/// تخطيط محتوى شاشة ساعات العمل بعد اكتمال التحميل.
class WorkingHoursContent extends StatelessWidget {
  const WorkingHoursContent({
    super.key,
    required this.controller,
    required this.onPickOpen,
    required this.onPickClose,
    required this.onSave,
    required this.onReset,
  });

  final WorkingHoursController controller;
  final VoidCallback onPickOpen;
  final VoidCallback onPickClose;
  final VoidCallback onSave;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final hasUnsavedChanges =
        controller.current.hasChangesComparedTo(controller.saved);
    return SingleChildScrollView(
      padding: .symmetric(horizontal: 16.w, vertical: 16.h),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 16.h,
            children: [
              const WorkingHoursHeader(),
              WorkingDaysCard(
                days: controller.days,
                allDaysSelected: controller.allDaysSelected,
                onToggleDay: controller.toggleDay,
                onToggleAllDays: controller.toggleAllDays,
              ),
              WorkingTimesCard(
                openMinutes: controller.openMinutes,
                closeMinutes: controller.closeMinutes,
                onPickOpen: onPickOpen,
                onPickClose: onPickClose,
              ),
              WorkingHoursPreviewCard(
                current: controller.current,
                saved: controller.saved,
              ),
              SaveChangesButton(
                enabled: controller.canSave,
                saving: controller.isSaving,
                onPressed: onSave,
              ),
              if (hasUnsavedChanges)
                TextButton(
                  onPressed: onReset,
                  child: const Text('إلغاء واستعادة الإعدادات السابقة'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
