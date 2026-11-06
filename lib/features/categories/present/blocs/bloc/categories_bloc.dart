import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/models/error_info.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../domain/entities/categories_res_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/use_cases/categories_use_cases.dart';
part 'categories_bloc.freezed.dart';
part 'categories_event.dart';
part 'categories_state.dart';

@singleton
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesUseCases categoriesUseCases;
  CategoriesBloc({required this.categoriesUseCases})
    : super(const CategoriesState.initial()) {
    on<CategoriesEvent>((event, emit) async {
      await event.when(
        get: () async {
          emit(const CategoriesState.loading());
          await categoriesUseCases.get().then((result) async {
            await result.when(
              success: (res) async {
                emit(CategoriesState.loaded(categories: res ?? []));
              },
              failure: (errorInfo) async {
                emit(CategoriesState.failure(errorInfo: errorInfo));
              },
            );
          });
        },
      );
    });
  }
}
