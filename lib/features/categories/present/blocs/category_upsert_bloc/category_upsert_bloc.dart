import 'package:alzefr_dash/features/categories/domain/use_cases/categories_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/models/error_info.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../domain/entities/category_upsert_req_entity.dart';
part 'category_upsert_bloc.freezed.dart';
part 'category_upsert_event.dart';
part 'category_upsert_state.dart';

@lazySingleton
class CategoryUpsertBloc
    extends Bloc<CategoryUpsertEvent, CategoryUpsertState> {
  final CategoriesUseCases categoriesUseCases;
  CategoryUpsertBloc({required this.categoriesUseCases})
    : super(const CategoryUpsertState.initial()) {
    on<CategoryUpsertEvent>((event, emit) async {
      await event.when(
        dataChanged: (categoryUpsertReq) {
          state.maybeMap(
            loaded: (state) {
              emitCustomLoaded(
                emit: emit,
                state: state.copyWith(categoryUpsertReq: categoryUpsertReq),
              );
            },
            orElse: () {
              emit(
                CategoryUpsertState.loaded(
                  categoryUpsertReq: categoryUpsertReq,
                  formzSubmissionStatus: .initial,
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
              await categoriesUseCases
                  .upsert(req: state.categoryUpsertReq!)
                  .then((res) async {
                    await res.when(
                      success: (res) async {
                        emit(CategoryUpsertState.success());
                        emitCustomLoaded(emit: emit, state: state);
                      },
                      failure: (apiErrorModel) async {
                        emit(
                          CategoryUpsertState.failure(
                            apiErrorModel: apiErrorModel,
                          ),
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
    required Emitter<CategoryUpsertState> emit,
    required _Loaded state,
    FormzSubmissionStatus? formzSubmissionStatus,
  }) {
    emit(
      state.copyWith(
        formzSubmissionStatus:
            formzSubmissionStatus ??
            _validateForm(categoryUpsertReq: state.categoryUpsertReq!),
      ),
    );
  }

  void emitCustomFailure({
    required Emitter<CategoryUpsertState> emit,
    required ErrorInfo apiErrorModel,
  }) {
    return emit(CategoryUpsertState.failure(apiErrorModel: apiErrorModel));
  }

  FormzSubmissionStatus _validateForm({
    required CategoryUpsertReqEntity categoryUpsertReq,
  }) {
    return (Formz.validate([
          categoryUpsertReq.name ?? const GenericFormInput.pure(),
        ]))
        ? FormzSubmissionStatus.success
        : FormzSubmissionStatus.failure;
  }
}
