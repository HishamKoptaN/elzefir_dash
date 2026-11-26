import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/extensions/responsive_icon_extension.dart';
import '../utils/extensions/theme_ext.dart';

class CustomCopyWidget extends StatelessWidget {
  const CustomCopyWidget({super.key, required this.text, required this.title});
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: text));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم نسخ $title'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(4.r),
        child: Icon(
          Icons.content_copy_rounded,
          size: 12.iconRes,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
