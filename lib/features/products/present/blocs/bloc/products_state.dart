part of 'products_bloc.dart';

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loaded({required List<ProductEntity>? products}) =
      _Loaded;
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.success() = _Success;
  const factory ProductsState.failure({required ErrorInfo apiErrorModel}) =
      _Failure;
}
