import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/networking/api_result.dart';
import '../../../../../../core/errors/models/error_info.dart';
import '../../../domain/usecases/auth_use_casees.dart';
part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCases useCases;
  AuthBloc(this.useCases) : super(const AuthState.init()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        check: (completer) async {
          final res = await useCases.check();
          await res.when(
            success: (v) {
              emit(const AuthState.authenticated());
            },
            failure: (apiErrorModel) {
              emit(const AuthState.unauthenticated());
            },
          );
          completer?.complete();
        },
        authToken: (completer) async {
          final res = await useCases.authToken();
          await res.when(
            success: (v) {
              emit(const AuthState.authenticated());
            },
            failure: (apiErrorModel) {
              emit(const AuthState.unauthenticated());
            },
          );
          completer?.complete();
        },
        emitAuthenticated: () async {
          emit(const AuthState.authenticated());
        },
        signedOut: () async {
          final res = await useCases.signOut();
          await res.when(
            success: (v) {
              emit(const AuthState.unauthenticated());
            },
            failure: (apiErrorModel) {
              emit(AuthState.failure(apiErrorModel));
              emit(const AuthState.unauthenticated());
            },
          );
        },
      );
    });
  }
}
