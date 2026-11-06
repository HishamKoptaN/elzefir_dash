import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../widgets/auth_page_layout.dart';
import '../../../widgets/custom_auth_btn.dart';
import '../../../widgets/custom_auth_text_form_field.dart';
import '../bloc/forgot_pass_bloc.dart';
import 'widgets/debug_auto_fill.dart';

class ForgotPassView extends StatelessWidget {
  static const String routeName = 'forgot-password';
  const ForgotPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return DebugAutoFill(
      child: CustomScaffold(
        title: 'نسيت كلمة المرور',
        body: BlocConsumer<ForgotPassBloc, ForgotPassState>(
          bloc: getIt<ForgotPassBloc>(),
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
                  title: "نسيت كلمة المرور",
                  form: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 75.h,
                      children: [
                        Text(
                          '*سوف نرسل لك رسالة لتعيين او إعادة تعيين كلمة المرور الجديدة الخاصة بك',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22.sp,
                            height: 25 / 22,
                            letterSpacing: -0.06,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        CustomAuthTextFormField(
                          initialValue: email.value,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "البريد الإلكتروني",
                          suffixIcon: Icons.mail,
                          onChanged: (v) {
                            context.read<ForgotPassBloc>().add(
                              ForgotPassEvent.dataChanged(
                                email: EmailFormInput.dirty(v!),
                              ),
                            );
                          },
                        ),
                        customAuthBtn(
                          context: context,
                          onPressed: formzSubmissionStatus.isSuccess
                              ? () => context.read<ForgotPassBloc>().add(
                                  const ForgotPassEvent.sendPassResetEmail(),
                                )
                              : null,
                          formzSubmissionStatus: formzSubmissionStatus,
                          title: "إرسال",
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
      ),
    );
  }
}
