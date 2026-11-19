import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../working_hours/present/widgets/working_hours_display.dart';
import 'contacts_items.dart';
import 'footer_widget.dart';

class FooterMobileLayout extends StatelessWidget implements FooterWidget {
  const FooterMobileLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      spacing: 12.h,
      children: [
        FooterTitleWidget(),
        FooterDescriptionWidget(),
        RestaurantHighlights(),
        CustomFooterDividerWidget(),
        const FooterContactsItems(),
        CustomFooterDividerWidget(),
        Text(
          'ساعات العمل',
          style: context.textTheme.headlineLarge?.copyWith(color: Colors.white),
        ),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const WorkingHoursDisplay(compact: true),
              CustomFooterDividerWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
