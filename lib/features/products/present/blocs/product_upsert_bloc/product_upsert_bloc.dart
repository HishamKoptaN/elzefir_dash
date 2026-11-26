import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/models/error_info.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/utils/price_input.dart';
import '../../../domain/entities/product_upsert_req_entity.dart';
import '../../../domain/use_cases/products_use_cases.dart';
part 'product_upsert_bloc.freezed.dart';
part 'product_upsert_event.dart';
part 'product_upsert_state.dart';

@lazySingleton
class ProductUpsertBloc extends Bloc<ProductUpsertEvent, ProductUpsertState> {
  final ProductsUseCase productsUseCases;
  ProductUpsertBloc({required this.productsUseCases})
    : super(const ProductUpsertState.initial()) {
    on<ProductUpsertEvent>((event, emit) async {
      await event.when(
        reset: () async {
          emit(
            const ProductUpsertState.loaded(
              formzSubmissionStatus: FormzSubmissionStatus.initial,
            ),
          );
        },
        dataChanged: (productUpsertReq) {
          state.maybeMap(
            loaded: (state) {
              _emitCustomLoaded(
                emit: emit,
                state: state.copyWith(productUpsertReq: productUpsertReq),
              );
            },
            orElse: () {
              emit(
                ProductUpsertState.loaded(
                  productUpsertReq: productUpsertReq,
                  formzSubmissionStatus: FormzSubmissionStatus.initial,
                ),
              );
            },
          );
        },
        upsert: () async {
          await state.mapOrNull(
            loaded: (state) async {
              final req = state.productUpsertReq;
              // The save button is disabled while the form is invalid, but the
              // event can be dispatched some other way, so never write an
              // invalid product: report why through the error state instead.
              if (req == null ||
                  _validateForm(productUpsertReq: req) !=
                      FormzSubmissionStatus.success) {
                _emitCustomLoaded(
                  emit: emit,
                  state: state,
                  errorInfo: const ErrorInfo(
                    title: 'بيانات غير مكتملة',
                    message: 'أكمل بيانات المنتج (الاسم، الوصف، السعر) قبل الحفظ',
                  ),
                );
                return;
              }

              _emitCustomLoaded(
                emit: emit,
                state: state.copyWith(formzSubmissionStatus: .inProgress),
              );
              await productsUseCases.upsert(req: state.productUpsertReq!).then((
                res,
              ) async {
                await res.when(
                  success: (res) async {
                    emit(ProductUpsertState.success());
                    _emitCustomLoaded(emit: emit, state: state);
                  },
                  failure: (apiErrorModel) async {
                    // Keep the loaded form (and everything typed into it) so the
                    // admin can fix the problem and retry instead of losing it.
                    _emitCustomLoaded(
                      emit: emit,
                      state: state,
                      errorInfo: apiErrorModel,
                    );
                  },
                );
              });
            },
          );
        },
      );
    });
  }
  void _emitCustomLoaded({
    required Emitter<ProductUpsertState> emit,
    required _Loaded state,
    FormzSubmissionStatus? formzSubmissionStatus,
    ErrorInfo? errorInfo,
  }) {
    emit(
      state.copyWith(
        formzSubmissionStatus:
            formzSubmissionStatus ??
            _validateForm(productUpsertReq: state.productUpsertReq!),
        // Cleared on every other emission, so an error is reported once.
        errorInfo: errorInfo,
      ),
    );
  }

  void emitCustomFailure({
    required Emitter<ProductUpsertState> emit,
    required ErrorInfo apiErrorModel,
  }) {
    return emit(ProductUpsertState.failure(apiErrorModel: apiErrorModel));
  }

  FormzSubmissionStatus _validateForm({
    required ProductUpsertReqEntity productUpsertReq,
  }) {
    return (Formz.validate([
          productUpsertReq.name ?? const GenericFormInput.pure(),
          productUpsertReq.title ?? const GenericFormInput.pure(),
          productUpsertReq.description ?? const GenericFormInput.pure(),
          productUpsertReq.price ?? const GenericFormInput.pure(),
        ]) &&
        isValidPrice(productUpsertReq.price?.value ?? ''))
        ? FormzSubmissionStatus.success
        : FormzSubmissionStatus.failure;
  }
}
