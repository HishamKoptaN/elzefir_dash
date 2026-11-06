import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/device_helper.dart';
import '../../../../../core/widgets/custom_dialog/custom_dialog.dart';
import '../blocs/auth_bloc/auth_bloc.dart';

class SidebarLogoutWidget extends StatelessWidget {
  final int currentIndex;
  const SidebarLogoutWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.39.w),
      child: InkWell(
        onTap: () async {
          CustomDialog.show(
            context: context,
            title: '',
            child: LogoutDialog(),
            showExitIcon: false,
            showExitBtn: false,
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.39.w, vertical: 12.h),
          decoration: BoxDecoration(color: Colors.red.withOpacity(0.1)),
          child: Row(
            children: [
              Text(
                'تسجيل الخروج',
                textAlign: .center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10.w),
              Icon(
                Icons.logout,
                color: Colors.red,
                size: AppResponsive.responsive(
                  context,
                  mobile: 14,
                  tablet: 16,
                  desktop: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      icon: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.danger.withOpacity(0.12),
        child: const Icon(
          Icons.logout_rounded,
          color: AppColors.danger,
          size: 28,
        ),
      ),
      title: Text(
        'تسجيل الخروج',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
      ),
      content: Text(
        'هل أنت متأكد من أنك تريد تسجيل الخروج من حسابك؟',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 34.sp),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
      actions: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: AppColors.danger),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                ),
                child: Text(
                  'إلغاء',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.danger,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  getIt<AuthBloc>().add(const AuthEvent.signedOut());
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.danger,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 0,
                ),
                child: Text(
                  'خروج',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
