import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// زر الحفظ الرئيسي، لا يُفعّل إلا عند وجود تغييرات صالحة.
class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({
    super.key,
    required this.enabled,
    required this.saving,
    required this.onPressed,
  });

  final bool enabled;
  final bool saving;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: FilledButton(
        onPressed: enabled ? onPressed : null,
        child: saving
            ? SizedBox(
                width: 18.r,
                height: 18.r,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: context.colorScheme.onPrimary,
                ),
              )
            : Text('حفظ التغييرات'),
      ),
    );
  }
}
