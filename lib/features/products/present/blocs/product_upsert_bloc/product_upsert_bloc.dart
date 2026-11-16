import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/models/error_info.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../settlement_methods/domain/entities/settlement_method_entity.dart';
import '../../../../settlement_methods/domain/repo/settlement_methods_repo.dart';
import '../../../domain/entities/product_upsert_req_entity.dart';
import '../../../domain/use_cases/products_use_cases.dart';
part 'product_upsert_bloc.freezed.dart';
part 'product_upsert_event.dart';
part 'product_upsert_state.dart';

@lazySingleton
class ProductUpsertBloc extends Bloc<ProductUpsertEvent, ProductUpsertState> {
  final ProductsUseCase productsUseCases;
  final SettlementMethodsRepo settlementMethodsRepo;
  ProductUpsertBloc({
    required this.productsUseCases,
    required this.settlementMethodsRepo,
  }) : super(const ProductUpsertState.initial()) {
    on<ProductUpsertEvent>((event, emit) async {
      await event.when(
        reset: () async {
          emit(const ProductUpsertState.loading());
          final methodsRes = await settlementMethodsRepo.getSettlementMethods();
          methodsRes.fold(
            (l) => emit(ProductUpsertState.failure(apiErrorModel: l)),
            (methods) => emit(
              ProductUpsertState.loaded(
                productUpsertReq: ProductUpsertReqEntity(),
                formzSubmissionStatus: .initial,
                availableMethods: methods,
              ),
            ),
          );
        },
        dataChanged: (productUpsertReq) {
          state.maybeMap(
            loaded: (state) {
              emitCustomLoaded(
                emit: emit,
                state: state.copyWith(productUpsertReq: productUpsertReq),
              );
            },
            orElse: () {
              // Should not happen, but fallback
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
              emitCustomLoaded(
                emit: emit,
                state: state.copyWith(formzSubmissionStatus: .inProgress),
              );
              await productsUseCases.upsert(req: state.productUpsertReq!).then((
                res,
              ) async {
                await res.when(
                  success: (res) async {
                    emit(ProductUpsertState.success());
                    emitCustomLoaded(emit: emit, state: state);
                  },
                  failure: (apiErrorModel) async {
                    emit(
                      ProductUpsertState.failure(apiErrorModel: apiErrorModel),
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
  void emitCustomLoaded({
    required Emitter<ProductUpsertState> emit,
    required _Loaded state,
    FormzSubmissionStatus? formzSubmissionStatus,
  }) {
    emit(
      state.copyWith(
        formzSubmissionStatus:
            formzSubmissionStatus ??
            _validateForm(productUpsertReq: state.productUpsertReq!),
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
        productUpsertReq.settlementMethods.isNotEmpty)
        ? FormzSubmissionStatus.success
        : FormzSubmissionStatus.failure;
  }
}
