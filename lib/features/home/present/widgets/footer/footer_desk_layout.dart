import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/extensions/responsive_icon_extension .dart';
import 'contacts_items.dart';
import 'footer_widget.dart';

class FooterDeskLayout extends StatelessWidget implements FooterWidget {
  const FooterDeskLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisAlignment: .spaceBetween,
      children: [
        FooterDesktopAboutSection(),
        Expanded(flex: 2, child: const FooterContactsItems()),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ساعات العمل',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(16.sp),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Color(0xFFFACC15),
                          size: 16.iconRes,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'السبت - الخميس',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Padding(
                      padding: EdgeInsets.only(right: 24.w),
                      child: Text(
                        '10:00 ص - 1:00 ص',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Divider(color: Colors.white10, height: 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
