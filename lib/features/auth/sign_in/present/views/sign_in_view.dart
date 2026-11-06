import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import '../../../../../core/routing/utils/navigation_service.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../sign_up/present/views/sign_up_view.dart';
import '../../../widgets/auth_page_layout.dart';
import '../../../widgets/custom_auth_btn.dart';
import '../blocs/bloc/sign_in_bloc.dart';
import 'sign_in_debug_auto_fill.dart';
import 'widgets/sign_in_form.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static const String routeName = 'sign-in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return SignInDebugAutoFill(
      child: Scaffold(
        body: BlocConsumer<SignInBloc, SignInState>(
          bloc: getIt<SignInBloc>(),
          listener: (context, state) async {
            await state.whenOrNull(
              failure: (apiError) {
                context.showErrorSnackBar(
                  title: apiError.title,
                  message: apiError.message,
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (signIn, formzSubmissionStatus) {
                return AuthPageLayout(
                  title: 'تسجيل الدخول',
                  form: SignInForm(
                    signIn: signIn,
                    formzSubmissionStatus: formzSubmissionStatus,
                  ),
                  bottomWidget: Wrap(
                    alignment: WrapAlignment.center,
                    direction: .vertical,
                    runSpacing: 7.5.h,
                    children: [
                      customAuthBtn(
                        title: 'تسجيل دخول',
                        context: context,
                        onPressed: formzSubmissionStatus.isSuccess
                            ? () {
                                getIt<SignInBloc>().add(
                                  const SignInEvent.signIn(),
                                );
                              }
                            : null,
                        formzSubmissionStatus: formzSubmissionStatus,
                      ),
                      const SizedBox(height: 10),
                      // SizedBox(
                      //   width: AuthSizes.fieldWidth(context),
                      //   height: AuthSizes.fieldHeight(context),
                      //   child: ElevatedButton.icon(
                      //     label: const Text("تسجيل دخول باستخدام رقم الهاتف"),
                      //     iconAlignment: .end,
                      //     icon: const Icon(Icons.phone_iphone),
                      //     onPressed: () {
                      //       NavigationService.pushNamed(
                      //         context: context,
                      //         routeName: PhoneSignInView.routeName,
                      //       );
                      //     },
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ليس لديك حساب؟',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 24.sp,
                              height: 20 / 18,
                              letterSpacing: -0.0642857,
                              color: context.colorScheme.primary,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          TextButton(
                            onPressed: () {
                              NavigationService.goNamed(
                                context: context,
                                routeName: SignUpView.routeName,
                              );
                            },
                            child: Text(
                              'إنشاء حساب',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22.sp,
                                height: 20 / 18,
                                letterSpacing: -0.0642857,
                                color: context.colorScheme.primary,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
