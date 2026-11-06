import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../blocs/auth_bloc/auth_bloc.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});
  static const String routeName = 'splash';

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: getIt<AuthBloc>(),
        builder: (context, firebaseAuthState) {
          return firebaseAuthState.maybeMap(
            authenticated: (s) {
              return Center(
                child: const CircularProgressIndicator(color: Colors.black),
              );
            },
            orElse: () {
              return Center(
                child: const CircularProgressIndicator(color: Colors.black),
              );
            },
          );
        },
      ),
    );
  }
}
