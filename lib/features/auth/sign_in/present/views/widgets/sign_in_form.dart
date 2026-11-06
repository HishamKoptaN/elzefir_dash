import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/routing/utils/navigation_service.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../auth_sizes.dart';
import '../../../../forgot_password/present/views/forgot_pass_view.dart';
import '../../../../widgets/custom_auth_text_form_field.dart';
import '../../../domain/entities/IdentityInput.dart';
import '../../../domain/entities/sign_in_req_entity.dart';
import '../../blocs/bloc/sign_in_bloc.dart';

class SignInForm extends StatelessWidget {
  final SignInReqEntity signIn;
  final FormzSubmissionStatus formzSubmissionStatus;

  const SignInForm({
    super.key,
    required this.signIn,
    required this.formzSubmissionStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          CustomAuthTextFormField(
            initialValue: signIn.email?.value,
            onChanged: (v) {
              getIt<SignInBloc>().add(
                SignInEvent.dataChanged(
                  signIn: signIn.copyWith(email: IdentityInput.dirty(v ?? '')),
                ),
              );
            },
            hintText: 'البريد الإلكتروني / اسم الحساب',
            prefixIcon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            // validator: (v) {
            //   if (v == null || v.isEmpty) {
            //     return 'الرجاء إدخال البريد الإلكتروني';
            //   }
            //   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) {
            //     return 'الرجاء إدخال بريد إلكتروني صحيح';
            //   }
            //   return null;
            // },
          ),
          Gap(4.h),
          CustomAuthTextFormField(
            initialValue: signIn.password?.value,
            onChanged: (v) {
              getIt<SignInBloc>().add(
                SignInEvent.dataChanged(
                  signIn: signIn.copyWith(
                    password: PasswordFormInput.dirty(v ?? ''),
                  ),
                ),
              );
            },
            obscureText: signIn.obscurePassword,
            onToggleObscure: () {
              getIt<SignInBloc>().add(
                SignInEvent.dataChanged(
                  signIn: signIn.copyWith(
                    obscurePassword: !signIn.obscurePassword,
                  ),
                ),
              );
            },
            hintText: 'كلمة السر',
            prefixIcon: Icons.lock,
            suffixIcon: signIn.obscurePassword
                ? Icons.visibility
                : Icons.visibility_off,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'الرجاء إدخال كلمة المرور';
              }
              if (v.length < 6) {
                return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
              }
              return null;
            },
          ),
          SizedBox(
            height: 42.h,
            width: AuthSizes.fieldWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Checkbox(
                  value: signIn.rememberMe,
                  onChanged: (v) {
                    getIt<SignInBloc>().add(
                      SignInEvent.dataChanged(
                        signIn: signIn.copyWith(rememberMe: v!),
                      ),
                    );
                  },
                  checkColor: Colors.white,
                ),
                Text('تذكرني', style: TextStyle(fontSize: 20.sp)),
                Spacer(),
                TextButton(
                  onPressed: () { 
                    NavigationService.pushNamed(
                      context: context,
                      routeName: ForgotPassView.routeName,
                    );
                  },
                  child: Text(
                    'نسيت كلمة المرور',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                      color: context.colorScheme.primary,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(4.h),
        ],
      ),
    );
  }
}
