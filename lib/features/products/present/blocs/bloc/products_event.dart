part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.get() = _Get;
  const factory ProductsEvent.delete(int id) = _Delete;
}
