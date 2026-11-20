import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/utils/extensions/theme_ext.dart';
import '../../../../core/widgets/feedback/error_content_widget.dart';
import '../controller/visitors_controller.dart';
import '../widgets/visitor_stat_card.dart';
import '../widgets/visitors_daily_chart.dart';

/// شاشة إحصاءات زوار موقع الزفر، تُحدَّث مباشرة من Firestore.
class VisitorsView extends StatefulWidget {
  const VisitorsView({super.key});

  static const String routeName = 'visitors';

  @override
  State<VisitorsView> createState() => _VisitorsViewState();
}

class _VisitorsViewState extends State<VisitorsView> {
  final VisitorsController _controller = VisitorsController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '—';
    }
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        if (_controller.isLoading) {
          return Center(
            child: Text(
              'جارٍ تحميل الإحصاءات...',
              style: context.textTheme.bodyMedium,
            ),
          );
        }
        if (_controller.loadError != null) {
          return CustomErrorWidget(
            message: 'تعذّر تحميل إحصاءات الزوار',
            showRetryButton: false,
          );
        }
        final stats = _controller.stats;
        return ListView(
          padding: .all(16.r),
          children: [
            Row(
              children: [
                VisitorStatCard(
                  label: 'إجمالي الزيارات',
                  value: '${stats.totalVisits}',
                  icon: FontAwesomeIcons.eye,
                ),
                SizedBox(width: 12.w),
                VisitorStatCard(
                  label: 'زوار فريدون',
                  value: '${stats.uniqueVisitors}',
                  icon: FontAwesomeIcons.users,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              'آخر زيارة: ${_formatDate(stats.lastVisitAt)}',
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: 16.h),
            Text(
              'الزيارات خلال آخر 7 أيام',
              style: context.textTheme.titleMedium,
            ),
            SizedBox(height: 8.h),
            VisitorsDailyChart(daily: stats.recentDaily),
          ],
        );
      },
    );
  }
}
