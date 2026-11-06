// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:form_inputs/form_inputs.dart';
// import 'package:formz/formz.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import '../../../../../../core/di/dependency_injection.dart';
// import '../../../../../../core/errors/api_error_model.dart';
// import '../../../../../../core/networking/api_result.dart';
// import '../../../auth/present/bloc/auth_bloc.dart';
// import '../../domain/entities/sign_up_req_entity.dart';
// import '../../domain/use_cases/sign_up_use_cases.dart';

// part 'phone_bloc.freezed.dart';
// part 'phone_event.dart';
// part 'phone_state.dart';

// @lazySingleton
// class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
//   final SignUpUseCases signUpUseCases;

//   SignUpBloc({required this.signUpUseCases})
//     : super(
//         SignUpState.loaded(
//           signUpReq: SignUpReqEntity(),
//           formzSubmissionStatus: FormzSubmissionStatus.initial,
//         ),
//       ) {
//     on<SignUpEvent>((event, emit) async {
//       await event.when(
//         signUp: () async {
//           await state.mapOrNull(
//             loaded: (state) async {
//               emitCustomLoaded(
//                 emit: emit,
//                 state: state.copyWith(
//                   formzSubmissionStatus: FormzSubmissionStatus.inProgress,
//                 ),
//                 formzSubmissionStatus: FormzSubmissionStatus.inProgress,
//               );
//               final result = await signUpUseCases.signUp(
//                 signUpReq: state.signUpReq,
//               );
//               await result.when(
//                 success: (_) async {
//                   emitCustomLoaded(
//                     emit: emit,
//                     state: state.copyWith(
//                       signUpReq: SignUpReqEntity(),
//                       formzSubmissionStatus: FormzSubmissionStatus.success,
//                     ),
//                   );
//                   getIt<AuthBloc>().add(const AuthEvent.emitAuthenticated());
//                 },
//                 failure: (apiErrorModel) {
//                   emitCustomFailure(emit: emit, apiErrorModel: apiErrorModel);
//                   emitCustomLoaded(emit: emit, state: state);
//                 },
//               );
//             },
//           );
//         },
//         dataChanged: (signUpReq) async {
//           await state.mapOrNull(
//             loaded: (state) {
//               emitCustomLoaded(
//                 emit: emit,
//                 state: state.copyWith(signUpReq: signUpReq!),
//               );
//             },
//           );
//         },
//       );
//     });
//   }

//   void emitCustomLoaded({
//     required Emitter<SignUpState> emit,
//     required _Loaded state,
//     FormzSubmissionStatus? formzSubmissionStatus,
//   }) {
//     emit(
//       state.copyWith(
//         formzSubmissionStatus:
//             formzSubmissionStatus ?? _validateForm(signUpReq: state.signUpReq),
//       ),
//     );
//   }

//   void emitCustomFailure({
//     required Emitter<SignUpState> emit,
//     required ApiErrorModel apiErrorModel,
//   }) {
//     return emit(SignUpState.failure(error: apiErrorModel.error ?? ''));
//   }

//   FormzSubmissionStatus _validateForm({required SignUpReqEntity signUpReq}) {
//     return (Formz.validate([
//               signUpReq.name ?? const GenericFormInput.pure(),
//               signUpReq.email ?? const EmailFormInput.pure(),
//               signUpReq.password ?? const PasswordFormInput.pure(),
//             ]) &&
//             (signUpReq.isValidNumber ?? false) &&
//             signUpReq.confirmPassword?.value == signUpReq.password?.value)
//         ? FormzSubmissionStatus.success
//         : FormzSubmissionStatus.failure;
//   }
// }
