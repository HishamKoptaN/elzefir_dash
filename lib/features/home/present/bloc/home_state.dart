part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loaded({
    HomeResEntity? homeRes,
    bool? loading,
    @Default(null) int? selectedCategoryId,
  }) = _Loaded;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success() = _Success;
  const factory HomeState.failure({required ErrorInfo errorInfo}) = _Failure;
}
