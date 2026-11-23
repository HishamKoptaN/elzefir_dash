import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDividerWidget extends StatelessWidget {
  CustomDividerWidget({
    super.key,
    this.thickness,
  });

  final double? thickness;
  @override
  Widget build(context) {
    return Divider(
      color: Colors.black,
      thickness: thickness ?? 2.5.sp,
      height: 2,
    );
  }
}
