import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import '../auth_sizes.dart';

Widget customAuthBtn({
  Key? key,
  required VoidCallback? onPressed,
  required FormzSubmissionStatus formzSubmissionStatus,
  required String title,
  required BuildContext context,
}) {
  return SizedBox(
    width: AuthSizes.fieldWidth(context),
    height: AuthSizes.fieldHeight(context),
    child: ElevatedButton(
      key: const Key('signIn_button'),
      onPressed: formzSubmissionStatus.isInProgressOrSuccess ? onPressed : null,
      child: formzSubmissionStatus.isInProgress
          ? CircularProgressIndicator()
          : Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28.sp,
                height: 22 / 20,
                letterSpacing: -0.0714286,
                color: Colors.white,
              ),
            ),
    ),
  );
}

TextButton customAuthTextBtn({
  required BuildContext context,
  required void Function()? onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      'تسجيل دخول',
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
