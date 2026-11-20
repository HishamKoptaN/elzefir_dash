import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/date_format_ext.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../domain/entities/visitor_entity.dart';

class TopVisitorsCard extends StatelessWidget {
  const TopVisitorsCard({super.key, required this.visitors});

  final List<VisitorEntity> visitors;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: .all(16.r),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 8.h,
          children: [
            Text('أكثر الزوار زيارةً', style: context.textTheme.titleLarge),
            if (visitors.isEmpty)
              Padding(
                padding: .symmetric(vertical: 24.h),
                child: Text(
                  'لا توجد بيانات زوار بعد',
                  style: context.textTheme.bodyMedium,
                ),
              )
            else
              for (final visitor in visitors) _VisitorRow(visitor: visitor),
          ],
        ),
      ),
    );
  }
}

class _VisitorRow extends StatelessWidget {
  const _VisitorRow({required this.visitor});

  final VisitorEntity visitor;

  @override
  Widget build(BuildContext context) {
    final last = visitor.lastSeenAt;
    return ListTile(
      contentPadding: .zero,
      leading: CircleAvatar(
        backgroundColor: context.colorScheme.primary.withValues(alpha: 0.12),
        child: FaIcon(
          FontAwesomeIcons.user,
          size: 16.r,
          color: context.colorScheme.primary,
        ),
      ),
      title: Text(
        visitor.id,
        maxLines: 1,
        overflow: .ellipsis,
        style: context.textTheme.bodyMedium,
      ),
      subtitle: Text(
        last == null ? 'لا توجد زيارة مسجّلة' : 'آخر ظهور: ${last.shortArabic}',
        style: context.textTheme.labelSmall,
      ),
      trailing: Text(
        '${visitor.visits} زيارة',
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
