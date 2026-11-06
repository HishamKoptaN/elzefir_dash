import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/utils/extensions/theme_ext.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/feedback/app_snackbar.dart';
import '../auth_sizes.dart';
import 'present/blocs/bloc/sign_in_bloc.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
  static const String routeName = 'otp';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        bloc: getIt<SignInBloc>(),
        listener: (context, state) {
          state.mapOrNull(
            success: (state) {
              context.showSuccessSnackBar(
                title: 'تم اعادة ارسال رمز التحقق',
                message:
                    'تم اعادة ارسال رمز التحقق بنجاح الرجاء الانتظار قليلا',
              );
            },
            failure: (state) {
              context.showErrorSnackBar(
                title: state.apiError.title ?? 'فشل',
                message: state.apiError.message ?? 'حدث خطأ',
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeMap(
            loaded: (state) {
              final ValueNotifier<bool> isOtpCompleted = ValueNotifier<bool>(
                false,
              );
              return Center(
                child: OtpKit(
                  semanticValue: '123456',
                  title: 'تأكيد كود التحقق',
                  subtitle:
                      'أدخل رمز التحقق المكون من 6 أرقام المرسل إلي رقم الهاتف',
                  resendText: 'أعادة ارسال',
                  timerPrefix: 'بعد',
                  buttonText: 'تأكيد',
                  enableAutoValidation: true,
                  fieldCount: 6,
                  fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.underlined),
                  primaryColor: Colors.black,
                  backgroundColor: Colors.transparent,
                  contactInfo: state.signIn.phoneNumber?.value,
                  maskingType: MaskingType.phone,
                  buttonWidth: AuthSizes.fieldWidth(context),
                  buttonBackgroundColor: context.colorScheme.primary,
                  animationConfig: const OtpAnimationConfig(
                    enableAnimation: true,
                    enableFieldStateAnimation: true,
                    fieldFillAnimationType: FieldFillAnimationType.autoSlide,
                    fieldFillSlideOffset: Offset(6, 0),
                    fieldTransitionDuration: Duration(milliseconds: 120),
                    fieldTransitionCurve: Curves.easeOut,
                  ),
                  onChanged: (otp) {
                    getIt<SignInBloc>().add(
                      SignInEvent.dataChanged(
                        signIn: state.signIn.copyWith(smsCode: otp),
                      ),
                    );
                  },
                  onCompleted: (otp) {
                    getIt<SignInBloc>().add(
                      SignInEvent.signInWithPhoneNumber(),
                    );
                  },
                  onCompletionStateChanged: (val) {
                    isOtpCompleted.value = val;
                  },
                  onVerify: (otp) async {
                    getIt<SignInBloc>().add(
                      SignInEvent.signInWithPhoneNumber(),
                    );
                    return true;
                  },
                  onResend: () {
                    getIt<SignInBloc>().add(
                      SignInEvent.signInWithPhoneNumber(),
                    );
                  },
                ),
              );
            },
            orElse: () {
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}
