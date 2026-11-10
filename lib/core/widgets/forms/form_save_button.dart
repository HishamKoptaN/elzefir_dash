import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

class FormSaveButton extends StatelessWidget {
  const FormSaveButton({
    super.key,
    required this.label,
    required this.status,
    required this.onPressed,
  });

  final String label;
  final FormzSubmissionStatus status;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isInProgress = status.isInProgress;
    return SizedBox(
      width: .infinity,
      child: FilledButton(
        onPressed: status == FormzSubmissionStatus.success && !isInProgress
            ? onPressed
            : null,
        child: isInProgress
            ? SizedBox(
                height: 20.r,
                width: 20.r,
                child: const CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(label),
      ),
    );
  }
}