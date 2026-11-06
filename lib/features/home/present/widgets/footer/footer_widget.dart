import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utils/extensions/device_type_extension.dart';
import '../../../../../core/utils/extensions/responsive_icon_extension .dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import 'footer_desk_layout.dart';
import 'footer_mobile_layout.dart';

Future<void> execuateLaunchUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF001629),
      padding: .symmetric(vertical: 34.h, horizontal: 40.w),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          context.isDesk ? FooterDeskLayout() : FooterMobileLayout(),
          CustomFooterDividerWidget(),
          CopyRightWidget(),
        ],
      ),
    );
  }
}

Widget buildFontAwesomeSocialIcon(FaIconData icon, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(50.r),
    child: Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        shape: BoxShape.circle,
      ),
      child: FaIcon(icon, color: Colors.white, size: 18.iconRes),
    ),
  );
}

Widget buildSocialIcon(IconData icon, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    borderRadius: .circular(50.r),
    child: Container(
      padding: .all(30.sp),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 18.iconRes),
    ),
  );
}

class FooterDesktopAboutSection extends StatelessWidget {
  const FooterDesktopAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          FooterTitleWidget(),
          SizedBox(height: 16.h),
          FooterDescriptionWidget(),
          SizedBox(height: 20.h),
          RestaurantHighlights(),
        ],
      ),
    );
  }
}

class FooterTitleWidget extends StatelessWidget {
  const FooterTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: .all(8.sp),
          decoration: BoxDecoration(
            color: const Color(0xFFFACC15).withValues(alpha: 0.15),
            shape: .circle,
          ),
          child: Icon(
            Icons.set_meal,
            color: const Color(0xFFFACC15),
            size: 24.iconRes,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          'مطعم أسماك الزفر',
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

Widget buildContactItem({
  required BuildContext context,
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisSize: .min,
      children: [
        Container(
          padding: .all(20.sp),
          margin: .only(left: 8.w),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            shape: .circle,
          ),
          child: Icon(icon, color: const Color(0xFFFACC15), size: 16.iconRes),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            overflow: .visible,
            style: context.textTheme.labelLarge?.copyWith(
              color: Colors.white70,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildFontAwesomeIconsContactItem(
  BuildContext context,
  FaIconData icon,
  String text,
  VoidCallback onTap,
) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisSize: .min,
      children: [
        Container(
          padding: .all(30.sp),
          margin: .only(left: 8.w),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            shape: .circle,
          ),
          child: FaIcon(icon, color: const Color(0xFFFACC15), size: 16.iconRes),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            overflow: .visible,
            style: context.textTheme.labelLarge?.copyWith(
              color: Colors.white70,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildBadge({required BuildContext context, required String text}) {
  return Container(
    padding: .symmetric(horizontal: 10.w, vertical: 5.h),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.06),
      borderRadius: BorderRadius.circular(20.r),
      border: .all(color: Colors.white10),
    ),
    child: Text(
      text,
      style: context.textTheme.labelLarge?.copyWith(color: Colors.white70),
    ),
  );
}

class RestaurantHighlights extends StatelessWidget {
  const RestaurantHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      crossAxisAlignment: .start,
      children: [
        buildBadge(context: context, text: 'طازج يومياً 🐟'),
        buildBadge(context: context, text: 'توصيل سريع 🚚'),
        buildBadge(context: context, text: '7500+ تقييم ⭐'),
      ],
    );
  }
}

class CustomFooterDividerWidget extends StatelessWidget {
  const CustomFooterDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(vertical: 14.h),
      child: Divider(color: Colors.white12),
    );
  }
}

class FooterDescriptionWidget extends StatelessWidget {
  const FooterDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'نقدم أشهى المأكولات البحرية الطازجة منذ أكثر من 20 عامًا بجودة عالية وأسعار تناسب الجميع.',
      style: context.textTheme.bodyLarge?.copyWith(color: Colors.white70),
    );
  }
}

class CopyRightWidget extends StatelessWidget {
  const CopyRightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "© ${DateTime.now().year} مطعم أسماك الزفر. جميع الحقوق محفوظة.",
        textAlign: TextAlign.center,
        style: context.textTheme.bodyLarge?.copyWith(color: Colors.white70),
      ),
    );
  }
}
