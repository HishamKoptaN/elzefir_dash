import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'dart:math';
import '../blocs/bloc/sign_in_bloc.dart';

class SignInDebugAutoFill extends StatefulWidget {
  final Widget child;
  const SignInDebugAutoFill({super.key, required this.child});

  @override
  State<SignInDebugAutoFill> createState() => _SignInDebugAutoFillState();
}

class _SignInDebugAutoFillState extends State<SignInDebugAutoFill> {
  int _tapCount = 0;
  DateTime? _lastTap;
  int selectedOption = 0;
  final List<String> options = ['Random', 'Valid', 'Invalid'];

  final List<Map<String, String>> testAccounts = [
    {'email': 'youssef@gmail.com', 'password': 'password'},
    {'email': 'mohamed@gmail.com', 'password': 'password'},
    // {'email': 'waleed@gmail.com', 'password': 'password'},
  ];
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
      _tapCount = 0;
      _runLoginScenario(context);
    }
  }

  void _runLoginScenario(BuildContext context) {
    Map<String, String> selectedAccount;

    if (selectedOption == 0) {
      final random = Random();
      selectedAccount = testAccounts[random.nextInt(testAccounts.length)];
      debugPrint('Random account selected: ${selectedAccount['email']}');
    } else if (selectedOption == 1) {
      final validAccounts = testAccounts.take(4).toList();
      final random = Random();
      selectedAccount = validAccounts[random.nextInt(validAccounts.length)];
      debugPrint('Valid account selected: ${selectedAccount['email']}');
    } else {
      final invalidAccounts = testAccounts.skip(4).toList();
      final random = Random();
      selectedAccount = invalidAccounts[random.nextInt(invalidAccounts.length)];
      debugPrint('Invalid account selected: ${selectedAccount['email']}');
    }

    // context.read<SignInBloc>()
    //   ..add(
    //     SignInEvent.dataChanged(
    //       signIn: EmailInput.dirty(selectedAccount['email']!),
    //     ),
    //   )
    //   ..add(
    //     SignInEvent.dataChanged(
    //       password: PasswordInput.dirty(selectedAccount['password']!),
    //     ),
    //   )
    // ..add(const SignInEvent.signIn());
  }

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return widget.child;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _handleTap(context),
      child: Stack(
        children: [
          widget.child,
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.black54),
              child: Material(
                color: Colors.transparent,
                child: DropdownButton<int>(
                  value: selectedOption,
                  dropdownColor: Colors.black87,
                  style: const TextStyle(color: Colors.white),
                  underline: Container(),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                  },
                  items: options.map<DropdownMenuItem<int>>((String value) {
                    return DropdownMenuItem<int>(
                      value: options.indexOf(value),
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
