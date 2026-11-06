import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../core/utils/device_helper.dart';
import '../../../core/utils/extensions/theme_ext.dart';

class AuthPageLayout extends StatelessWidget {
  final String title;
  final Widget form;
  final Widget? bottomWidget;
  const AuthPageLayout({
    super.key,
    required this.title,
    required this.form,
    this.bottomWidget,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/logos/logo_solid.png',
              //   scale: AppResponsive.responsive(
              //     context,
              //     mobile: 1.2,
              //     tablet: 1,
              //     desktop: 1,
              //   ),
              // ),
              Gap(50.h),
              AuthTitleWidget(title: title),
              Gap(50.h),
              form,
              ?bottomWidget,
            ],
          ),
        ),
      ),
    );
  }
}

class AuthTitleWidget extends StatelessWidget {
  const AuthTitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 45.sp,
        height: 39 / 35,
        letterSpacing: -0.114286,
        color: const Color(0xFF54392E),
      ),
    );
  }
}
