part of 'settlement_methods_bloc.dart';

@freezed
class SettlementMethodsState with _$SettlementMethodsState {
  const factory SettlementMethodsState.initial() = _Initial;
  const factory SettlementMethodsState.loading() = _Loading;
  const factory SettlementMethodsState.loaded({
    @Default([]) List<SettlementMethodEntity> availableMethods,
  }) = _Loaded;
  const factory SettlementMethodsState.failure({required ErrorInfo errorInfo}) =
      _Failure;
}
