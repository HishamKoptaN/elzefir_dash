import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_inputs/form_inputs.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../sign_up/domain/entities/sign_up_req_entity.dart';
import '../sign_up/present/bloc/sign_up_bloc.dart';

/// Debug widget for auto-filling signup form during development
/// Triple tap anywhere on the wrapped widget to trigger auto-fill
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
    debugPrint('Tap detected! Count: $_tapCount');
    if (_tapCount >= 3) {
      debugPrint('✅ Triple tap detected! Running login scenario...');
      _tapCount = 0;
      _runLoginScenario(context);
    }
  }

  void _runLoginScenario(BuildContext context) {
    debugPrint('🚀 Running Debug AutoFill Login with BLoC...');
    getIt<SignUpBloc>().add(
      SignUpEvent.dataChanged(
        signUpReq: SignUpReqEntity(
          name: GenericFormInput.dirty(value: 'hisham'),
          email: EmailFormInput.dirty('heshamkoptan@gmail.com'),
          // phoneNumber: '01120445566',
          // dialCode: '20',
          // isoCode: 'EG',
          password: PasswordFormInput.dirty('password'),
          confirmPassword: ConfirmPasswordFormInput.dirty(
            value: 'password',
            password: 'password',
          ),
        ),
      ),
    );
    Future.delayed(const Duration(milliseconds: 100), () {
      getIt<SignUpBloc>().add(const SignUpEvent.signUp());
    });

    debugPrint('✅ AutoFill Login Done (via BLoC)');
  }

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return widget.child;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _handleTap(context),
      child: widget.child,
    );
  }
}
