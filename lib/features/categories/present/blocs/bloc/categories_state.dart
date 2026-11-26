part of 'categories_bloc.dart';

@freezed
abstract class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loaded({
    required List<CategoryEntity>? categories,
    bool? loading,
  }) = _Loaded;
  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.success() = _Success;
  const factory CategoriesState.failure({required ErrorInfo errorInfo}) =
      _Failure;
}
