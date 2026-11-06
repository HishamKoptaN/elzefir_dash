import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import 'dialog_header.dart';
import 'dialog_footer.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.showFooter = true,
    this.icon,
    required this.child,
    this.showExitIcon = true,
    this.showExitBtn = true,
  });
  final String title;
  final IconData? icon;
  final Widget child;
  final bool showFooter;
  final bool showExitIcon;
  final bool showExitBtn;

  static Future<void> show({
    required BuildContext context,
    required String title,
    IconData? icon,
    required Widget child,
    bool showFooter = true,
    bool showExitIcon = true,
    bool showExitBtn = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomDialog(
          showFooter: showFooter,
          icon: icon,
          title: title,
          showExitIcon: showExitIcon,
          showExitBtn: showExitBtn,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: LightColors().primary,
      insetPadding: EdgeInsets.zero,
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                DialogHeader(title: title, showExitIcon: showExitIcon),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  child: child,
                ),
                if (showFooter) DialogFooter(showExitBtn: showExitBtn),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
