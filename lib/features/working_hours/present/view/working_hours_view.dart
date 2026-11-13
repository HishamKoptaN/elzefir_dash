import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/theme_ext.dart';
import '../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../../core/widgets/feedback/error_content_widget.dart';
import '../../data/working_hours_data_src.dart';
import '../../domain/working_hours.dart';

/// شاشة إعدادات أيام وساعات العمل الخاصة بالمطعم.
class WorkingHoursView extends StatefulWidget {
  const WorkingHoursView({super.key});
  static const String routeName = 'working-hours';

  @override
  State<WorkingHoursView> createState() => _WorkingHoursViewState();
}

class _WorkingHoursViewState extends State<WorkingHoursView> {
  final WorkingHoursDataSrc _dataSrc = WorkingHoursDataSrc();

  bool _loading = true;
  bool _saving = false;
  Object? _loadError;

  Set<int> _days = {...WorkingHours.defaults.days};
  int _openMinutes = WorkingHours.defaults.openMinutes;
  int _closeMinutes = WorkingHours.defaults.closeMinutes;

  /// آخر إعدادات محفوظة فعلًا، تُعرض كمرجع للمستخدم.
  WorkingHours? _saved;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final saved = await _dataSrc.get();
      final hours = saved ?? WorkingHours.defaults;
      if (!mounted) return;
      setState(() {
        _loading = false;
        _saved = saved;
        _days = {...hours.days};
        _openMinutes = hours.openMinutes;
        _closeMinutes = hours.closeMinutes;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _loadError = error;
      });
    }
  }

  WorkingHours get _current {
    return WorkingHours(
      days: {..._days},
      openMinutes: _openMinutes,
      closeMinutes: _closeMinutes,
    );
  }

  bool get _allDaysSelected => _days.length == weekdayNames.length;

  void _toggleDay(int day) {
    setState(() {
      if (!_days.remove(day)) _days.add(day);
    });
  }

  void _toggleAllDays() {
    setState(() {
      if (_allDaysSelected) {
        _days.clear();
      } else {
        _days = {...weekdayNames.keys};
      }
    });
  }

  Future<void> _pickTime({required bool isOpen}) async {
    final currentMinutes = isOpen ? _openMinutes : _closeMinutes;
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: (currentMinutes ~/ 60) % 24,
        minute: currentMinutes % 60,
      ),
      helpText: isOpen ? 'وقت الفتح' : 'وقت الإغلاق',
      cancelText: 'إلغاء',
      confirmText: 'تأكيد',
    );
    if (picked == null || !mounted) return;
    setState(() {
      final minutes = picked.hour * 60 + picked.minute;
      if (isOpen) {
        _openMinutes = minutes;
      } else {
        _closeMinutes = minutes;
      }
    });
  }

  Future<void> _save() async {
    if (_days.isEmpty) {
      context.showErrorSnackBar(
        title: 'اختر أيام العمل',
        message: 'يجب تحديد يوم عمل واحد على الأقل',
      );
      return;
    }
    if (_openMinutes == _closeMinutes) {
      context.showErrorSnackBar(
        title: 'وقت غير صحيح',
        message: 'وقت الفتح ووقت الإغلاق لا يمكن أن يكونا متطابقين',
      );
      return;
    }
    final hours = _current;
    setState(() => _saving = true);
    try {
      await _dataSrc.save(hours);
      if (!mounted) return;
      setState(() {
        _saving = false;
        _saved = hours;
      });
      context.showSuccessSnackBar(
        title: 'تم الحفظ',
        message: 'تم حفظ أيام وساعات العمل بنجاح',
      );
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      context.showErrorSnackBar(
        title: 'خطأ',
        message: 'تعذّر حفظ ساعات العمل، حاول مرة أخرى',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_loadError != null) {
      return CustomErrorWidget(
        message: 'تعذّر تحميل إعدادات ساعات العمل',
        onRetry: _load,
      );
    }
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 16.h,
            children: [
              _buildHeader(context),
              _buildDaysCard(context),
              _buildTimesCard(context),
              _buildPreviewCard(context),
              SizedBox(
                height: 52.h,
                child: FilledButton.icon(
                  onPressed: _saving ? null : _save,
                  icon: _saving
                      ? SizedBox(
                          width: 18.r,
                          height: 18.r,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: context.colorScheme.onPrimary,
                          ),
                        )
                      : const Icon(Icons.save_outlined),
                  label: Text(_saving ? 'جارٍ الحفظ...' : 'حفظ ساعات العمل'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 4.h,
      children: [
        Text('ساعات العمل', style: context.textTheme.headlineLarge),
        Text(
          'حدّد أيام العمل ووقت الفتح والإغلاق، وستظهر هذه الإعدادات في صفحة المطعم.',
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildCard({required BuildContext context, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: child,
    );
  }

  Widget _buildDaysCard(BuildContext context) {
    return _buildCard(
      context: context,
      child: Column(
        crossAxisAlignment: .start,
        spacing: 12.h,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('أيام العمل', style: context.textTheme.titleMedium),
              ),
              TextButton.icon(
                onPressed: _toggleAllDays,
                icon: Icon(
                  _allDaysSelected
                      ? Icons.deselect_outlined
                      : Icons.select_all_outlined,
                  size: 18.r,
                ),
                label: Text(
                  _allDaysSelected ? 'إلغاء تحديد الكل' : 'تحديد كل الأيام',
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              for (final entry in weekdayNames.entries)
                FilterChip(
                  label: Text(entry.value),
                  selected: _days.contains(entry.key),
                  onSelected: (_) {
                    _toggleDay(entry.key);
                  },
                ),
            ],
          ),
          Text(
            _days.isEmpty
                ? 'لم يتم تحديد أي يوم عمل'
                : 'الأيام المحددة: ${formatWorkingDays(_days)}',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimesCard(BuildContext context) {
    return _buildCard(
      context: context,
      child: Column(
        crossAxisAlignment: .start,
        spacing: 12.h,
        children: [
          Text('ساعات العمل', style: context.textTheme.titleMedium),
          Row(
            spacing: 12.w,
            children: [
              Expanded(
                child: _TimeTile(
                  label: 'وقت الفتح',
                  value: formatClock(_openMinutes),
                  icon: Icons.wb_sunny_outlined,
                  onTap: () {
                    _pickTime(isOpen: true);
                  },
                ),
              ),
              Expanded(
                child: _TimeTile(
                  label: 'وقت الإغلاق',
                  value: formatClock(_closeMinutes),
                  icon: Icons.nightlight_outlined,
                  onTap: () {
                    _pickTime(isOpen: false);
                  },
                ),
              ),
            ],
          ),
          if (_openMinutes == _closeMinutes)
            Text(
              'وقت الفتح ووقت الإغلاق متطابقان، اختر وقتًا مختلفًا.',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.error,
              ),
            )
          else if (_openMinutes > _closeMinutes)
            Text(
              'وقت الإغلاق قبل وقت الفتح، لذا سيُحسب الإغلاق في اليوم التالي.',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPreviewCard(BuildContext context) {
    final current = _current;
    final isOpenNow = current.isOpenAt(DateTime.now());
    return _buildCard(
      context: context,
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10.h,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'المعاينة',
                  style: context.textTheme.titleMedium,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: (isOpenNow ? Colors.green : Colors.red).withValues(
                    alpha: 0.12,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  isOpenNow ? 'مفتوح الآن' : 'مغلق الآن',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: isOpenNow ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            formatWorkingHoursSummary(current),
            style: context.textTheme.bodyLarge,
          ),
          if (_saved != null)
            Text(
              'المحفوظ حاليًا: ${formatWorkingHoursSummary(_saved!)}',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
        ],
      ),
    );
  }
}

class _TimeTile extends StatelessWidget {
  const _TimeTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.5,
          ),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.6),
          ),
        ),
        child: Row(
          spacing: 10.w,
          children: [
            Icon(icon, color: context.colorScheme.primary),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 2.h,
                children: [
                  Text(
                    label,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                  Text(value, style: context.textTheme.titleMedium),
                ],
              ),
            ),
            Icon(
              Icons.edit_outlined,
              size: 18.r,
              color: context.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
