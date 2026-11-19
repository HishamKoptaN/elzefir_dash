import 'package:flutter/material.dart';

import '../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../../core/widgets/feedback/error_content_widget.dart';
import '../controller/working_hours_controller.dart';
import '../widgets/working_hours_content.dart';
import 'working_hours_time_picker.dart';

/// شاشة إعدادات أيام وساعات العمل الخاصة بالمطعم.
class WorkingHoursView extends StatefulWidget {
  const WorkingHoursView({super.key});
  static const String routeName = 'working-hours';

  @override
  State<WorkingHoursView> createState() => _WorkingHoursViewState();
}

class _WorkingHoursViewState extends State<WorkingHoursView> {
  final WorkingHoursController _controller = WorkingHoursController();

  @override
  void initState() {
    super.initState();
    _controller.load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickTime({required bool isOpen}) async {
    final minutes = await pickWorkingHoursTime(
      context: context,
      initialMinutes: isOpen
          ? _controller.openMinutes
          : _controller.closeMinutes,
      helpText: isOpen ? 'وقت الفتح' : 'وقت الإغلاق',
    );
    if (minutes == null) return;
    if (isOpen) {
      _controller.pickOpenMinutes(minutes);
    } else {
      _controller.pickCloseMinutes(minutes);
    }
  }

  Future<void> _save() async {
    final success = await _controller.save();
    if (!mounted) return;
    if (success) {
      context.showSuccessSnackBar(
        title: 'تم الحفظ',
        message: 'تم حفظ أيام وساعات العمل بنجاح',
      );
    } else {
      context.showErrorSnackBar(
        title: 'خطأ',
        message: 'تعذّر حفظ ساعات العمل، حاول مرة أخرى',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        if (_controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (_controller.loadError != null) {
          return CustomErrorWidget(
            message: 'تعذّر تحميل إعدادات ساعات العمل',
            onRetry: _controller.load,
          );
        }
        return WorkingHoursContent(
          controller: _controller,
          onPickOpen: () {
            _pickTime(isOpen: true);
          },
          onPickClose: () {
            _pickTime(isOpen: false);
          },
          onSave: _save,
          onReset: () {
            _controller.resetToSaved();
          },
        );
      },
    );
  }
}
