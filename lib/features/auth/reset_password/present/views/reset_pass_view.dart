import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../core/routing/utils/navigation_service.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../widgets/custom_auth_btn.dart';
import '../../../widgets/custom_auth_text_form_field.dart';
import '../../domain/entities/reset_pass_entity.dart';
import '../bloc/reset_pass_bloc.dart';

class ResetPassView extends StatelessWidget {
  static const String routeName = 'reset-password';
  const ResetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return DebugAutoFill(
      child: CustomScaffold(
        title: 'تغيير كلمة مرور ',
        body: BlocConsumer<ResetPassBloc, ResetPassState>(
          bloc: getIt<ResetPassBloc>(),
          listener: (context, state) async {
            await state.whenOrNull(
              success: () {
                context.showSuccessSnackBar(
                  title: "نجاح",
                  message: 'تم تغير كلمة المرور',
                );
              },
              failure: (error) {
                context.showSuccessSnackBar(
                  title: "فشل",
                  message: "فشل في تغيير كلمة المرور",
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (resetPassEntity, formzSubmissionStatus) {
                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 375),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 75.h,
                        children: [
                          Text(
                            'كلمة مرور جديدة',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 35.sp,
                              height: 39 / 35,
                              letterSpacing: -0.114286,
                              color: LightColors().primary,
                            ),
                          ),
                          CustomAuthTextFormField(
                            key: const Key('oldPassword_field'),
                            initialValue: resetPassEntity.oldPassword?.value,
                            hintText: "كلمة المرور القديمة",
                            prefixIcon: Icons.lock_outline,
                            isPassword: true,
                            obscureText: resetPassEntity.obscurePassword,
                            showPasswordToggle: true,
                            onToggleObscure: () {
                              getIt<ResetPassBloc>().add(
                                ResetPassEvent.dataChanged(
                                  resetPassEntity: resetPassEntity.copyWith(
                                    obscurePassword:
                                        !resetPassEntity.obscurePassword,
                                  ),
                                ),
                              );
                            },
                            suffixIcon: resetPassEntity.obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,

                            onChanged: (v) {
                              getIt<ResetPassBloc>().add(
                                ResetPassEvent.dataChanged(
                                  resetPassEntity: resetPassEntity.copyWith(
                                    oldPassword: PasswordFormInput.dirty(v!),
                                  ),
                                ),
                              );
                            },
                          ),
                          CustomAuthTextFormField(
                            key: const Key('newPassword_field'),
                            initialValue: resetPassEntity.newPassword?.value,
                            hintText: "كلمة المرور الجديدة",
                            prefixIcon: Icons.lock_outline,
                            isPassword: true,
                            obscureText: resetPassEntity.obscurePassword,
                            showPasswordToggle: true,
                            onToggleObscure: () {
                              getIt<ResetPassBloc>().add(
                                ResetPassEvent.dataChanged(
                                  resetPassEntity: resetPassEntity.copyWith(
                                    obscurePassword:
                                        !resetPassEntity.obscurePassword,
                                  ),
                                ),
                              );
                            },
                            suffixIcon: resetPassEntity.obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onChanged: (v) {
                              getIt<ResetPassBloc>().add(
                                ResetPassEvent.dataChanged(
                                  resetPassEntity: resetPassEntity.copyWith(
                                    newPassword: PasswordFormInput.dirty(v!),
                                  ),
                                ),
                              );
                            },
                          ),
                          CustomAuthTextFormField(
                            key: const Key('confirmPassword_field'),
                            initialValue:
                                resetPassEntity.confirmPassword?.value,
                            hintText: "تأكيد كلمة المرور",
                            prefixIcon: Icons.lock_outline,
                            isPassword: true,
                            obscureText: resetPassEntity.obscurePassword,
                            showPasswordToggle: true,
                            onToggleObscure: () {
                              getIt<ResetPassBloc>().add(
                                ResetPassEvent.dataChanged(
                                  resetPassEntity: resetPassEntity.copyWith(
                                    obscurePassword:
                                        !resetPassEntity.obscurePassword,
                                  ),
                                ),
                              );
                            },
                            suffixIcon: resetPassEntity.obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onChanged: (v) {
                              getIt<ResetPassBloc>().add(
                                ResetPassEvent.dataChanged(
                                  resetPassEntity: resetPassEntity.copyWith(
                                    confirmPassword: PasswordFormInput.dirty(
                                      v!,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          customAuthBtn(
                            context: context,
                            onPressed: formzSubmissionStatus.isSuccess
                                ? () {
                                    getIt<ResetPassBloc>().add(
                                      const ResetPassEvent.resetPass(),
                                    );
                                  }
                                : null,
                            formzSubmissionStatus: formzSubmissionStatus,
                            title: 'تغيير كلمة المرور',
                          ),
                        ],
                      ),
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

class DebugAutoFill extends StatefulWidget {
  final Widget child;
  const DebugAutoFill({super.key, required this.child});

  @override
  State<DebugAutoFill> createState() => _DebugAutoFillState();
}

class _DebugAutoFillState extends State<DebugAutoFill> {
  int _tapCount = 0;
  DateTime? _lastTap;

  void _handleTap(BuildContext context) {
    final now = DateTime.now();

    if (_lastTap != null &&
        now.difference(_lastTap!) > const Duration(seconds: 1)) {
      _tapCount = 0;
    }

    _lastTap = now;
    _tapCount++;
    if (_tapCount >= 3) {
      _tapCount = 0;
      _runLoginScenario(context);
    }
  }

  void _runLoginScenario(BuildContext context) {
    final random = Random();
    final selectedPassword = random.nextBool() ? 'password' : 'newpassword';
    getIt<ResetPassBloc>().add(
      ResetPassEvent.dataChanged(
        resetPassEntity: ResetPassEntity(
          oldPassword: PasswordFormInput.dirty(selectedPassword),
          newPassword: PasswordFormInput.dirty(selectedPassword),
          confirmPassword: PasswordFormInput.dirty(selectedPassword),
          obscurePassword: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return widget.child;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _handleTap(context),
      child: Container(
        constraints: BoxConstraints.expand(),
        child: widget.child,
      ),
    );
  }
}
