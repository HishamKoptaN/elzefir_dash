import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/models/error_info.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/use_cases/products_use_cases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

@singleton
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsUseCase useCases;

  ProductsBloc({required this.useCases}) : super(const .initial()) {
    on<ProductsEvent>((event, emit) async {
      await event.when(
        get: () async {
          emit(const .loading());
          await useCases.get().then((result) async {
            await result.when(
              success: (res) async {
                emit(.loaded(products: res ?? []));
              },
              failure: (apiErrorModel) async {
                emit(.failure(apiErrorModel: apiErrorModel));
              },
            );
          });
        },
        delete: (id) async {
          await useCases.delete(id).then((result) async {
            await result.when(
              success: (_) async {
                add(const ProductsEvent.get());
              },
              failure: (apiErrorModel) async {
                emit(.failure(apiErrorModel: apiErrorModel));
              },
            );
          });
        },
      );
    });
    add(.get());
  }
}
