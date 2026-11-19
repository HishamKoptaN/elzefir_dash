import 'package:flutter/material.dart';

import '../../working_hours/present/widgets/working_hours_status_badge.dart';
import 'widgets/footer/footer_widget.dart';

/// صفحة المطعم العامة التي تعرض الفوتر (وفيه ساعات العمل المحفوظة).
class RestaurantPageView extends StatelessWidget {
  const RestaurantPageView({super.key});
  static const String routeName = 'restaurant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001629),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: WorkingHoursStatusBadge(),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: const FooterWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
