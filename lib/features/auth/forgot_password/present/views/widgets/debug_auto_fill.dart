import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import '../../bloc/forgot_pass_bloc.dart';

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
    debugPrint('🚀 Running Debug Autofill Login with BLoC...');

    const testEmails = [
      'heshamkoptan@gmail.com',
      'heshamkoptan@gmail.com',
      'heshamkoptan@gmail.com',
    ];

    final testEmail = testEmails[0];
    debugPrint('📧 Using test email: $testEmail');
    debugPrint('✅ These domains are already authorized in Firebase Console');

    context.read<ForgotPassBloc>()
      ..add(ForgotPassEvent.dataChanged(email: EmailFormInput.dirty(testEmail)))
      ..add(const ForgotPassEvent.sendPassResetEmail());

    debugPrint('✅ Autofill Login Done (via BLoC)');
    debugPrint('🔍 Check your email at: $testEmail');
    debugPrint('⚠️ Make sure this email is authorized in Firebase Console');
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
