import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import '../../../../../../core/routing/utils/navigation_service.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../sign_in/present/views/sign_in_view.dart';
import '../../../../widgets/custom_auth_btn.dart';
import '../../../domain/entities/sign_up_req_entity.dart';
import '../../bloc/sign_up_bloc.dart';

class SignUpActions extends StatelessWidget {
  const SignUpActions({
    super.key,
    required this.formzSubmissionStatus,
    required this.signUpReq,
  });
  final FormzSubmissionStatus formzSubmissionStatus;
  final SignUpReqEntity signUpReq;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAuthBtn(
          title: 'انشاء ',
          context: context,
          onPressed: formzSubmissionStatus.isSuccess
              ? () {
                  getIt<SignUpBloc>().add(const SignUpEvent.signUp());
                }
              : () {
                  if (kDebugMode) {
                    getIt<SignUpBloc>().add(const SignUpEvent.signUp());
                  }
                },
          formzSubmissionStatus: formzSubmissionStatus,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'لديك حساب ؟',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: context.colorScheme.primary,
              ),
            ),
            customAuthTextBtn(
              context: context,
              onPressed: () {
                NavigationService.goNamed(
                  context: context,
                  routeName: SignInView.routeName,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
