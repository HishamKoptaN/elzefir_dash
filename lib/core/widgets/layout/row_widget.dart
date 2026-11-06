import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/custom_divider_widget.dart';

Widget buildDetailRow({required String title, required String value}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: TextStyle(fontSize: 25.sp)),
          Text(
            ': $title',
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      CustomDividerWidget(),
    ],
  );
}
