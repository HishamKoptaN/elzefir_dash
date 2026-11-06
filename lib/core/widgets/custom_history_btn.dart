import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHistoryBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomHistoryBtn({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .topStart,
      child: TextButton.icon(
        iconAlignment: .end,
        label: Text(
          title,
          textAlign: .start,
          style: TextStyle(fontSize: 24.sp, fontWeight: .bold),
        ),
        icon: Icon(Icons.history),
        onPressed: onPressed,
      ),
    );
  }
}
