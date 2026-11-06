import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_dialog/custom_dialog.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../auth/present/views/sidebar_logout_widget.dart';
import '../../../widgets/auth_page_layout.dart';
import '../../../widgets/custom_auth_btn.dart';
import '../bloc/sign_up_bloc.dart';

class VerifyEmailView extends StatefulWidget {
  static const String routeName = 'verify-email';
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView>
    with WidgetsBindingObserver {
  int _secondsRemaining = 60;
  Timer? _timer;
  bool _isResending = false;
  bool _isFirstTime = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _secondsRemaining = 0;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      final user = FirebaseAuth.instance.currentUser;
      await user?.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        AppRouter.router.refresh();
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEnabled = _secondsRemaining == 0;
    return CustomScaffold(
      showAppBar: false,
      body: BlocConsumer<SignUpBloc, SignUpState>(
        bloc: getIt<SignUpBloc>(),
        listener: (context, state) async {
          await state.whenOrNull(
            success: () {
              context.showSuccessSnackBar(
                title: "تم",
                message: "تم ارسال رابط تعيين كلمة المرور",
              );
            },
            failure: (error) {
              context.showSuccessSnackBar(
                title: "فشل",
                message: "فشل ارسال رابط تعيين كلمة المرور",
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (email, formzSubmissionStatus) {
              return AuthPageLayout(
                title: "التحقق من البريد الإلكتروني",
                form: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 20.h,
                    children: [
                      Text(
                        '*سوف نرسل لك رابط التحقق لتفعيل الحساب',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp,
                          height: 25 / 22,
                          letterSpacing: -0.06,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      customAuthBtn(
                        context: context,
                        onPressed: (isEnabled && !_isResending)
                            ? () async {
                                setState(() {
                                  _isResending = true;
                                });
                                AppRouter.router.refresh();
                                FirebaseAuth.instance.currentUser
                                    ?.sendEmailVerification()
                                    .then((value) {
                                      context.showSuccessSnackBar(
                                        title: "تم",
                                        message:
                                            "تم ارسال رابط التحقق لتفعيل الحساب",
                                      );
                                    })
                                    .catchError((error) {
                                      context.showSuccessSnackBar(
                                        title: "فشل",
                                        message:
                                            "فشل ارسال رابط تعيين كلمة المرور",
                                      );
                                    });
                                setState(() {
                                  _isFirstTime = false;
                                  _isResending = false;
                                  _secondsRemaining = 60;
                                });
                                _startTimer();
                              }
                            : () {},
                        formzSubmissionStatus: isEnabled ? .success : .initial,
                        title: _isFirstTime
                            ? "إرسال رابط التحقق"
                            : "إعادة إرسال الرابط",
                      ),
                      if (!isEnabled) ...[
                        SizedBox(height: 16.h),
                        Text(
                          "يمكنك إعادة الإرسال بعد $_secondsRemaining ثانية",
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                      ],
                      Gap(30.h),
                      TextButton(
                        onPressed: () async {
                          CustomDialog.show(
                            context: context,
                            title: '',
                            child: LogoutDialog(),
                            showExitIcon: false,
                            showExitBtn: false,
                          );
                        },
                        child: Text(
                          "تسجيل الخروج",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 22.sp,
                                height: 25 / 22,
                                letterSpacing: -0.06,
                                color: context.colorScheme.error,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
