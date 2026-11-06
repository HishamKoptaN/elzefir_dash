import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/device_helper.dart';

class CustomClearTemplateDateBtn extends StatelessWidget {
  const CustomClearTemplateDateBtn({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppResponsive.responsive(
        context,
        mobile: 400.w,
        tablet: 200.w,
        desktop: 100.w,
      ),
      height: 45.h,
      decoration: BoxDecoration(
        color: const Color(0xFF54392E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(5.r),
          bottomRight: Radius.circular(50.r),
          bottomLeft: Radius.circular(5.r),
        ),
      ),

      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.w,
          children: [
            Text(
              'مسح البيانات',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                height: 31 / 22,
                color: Colors.white,
              ),
            ),
            Icon(Icons.clear, color: Colors.white, size: 25.sp),
          ],
        ),
      ),
    );
  }
}
