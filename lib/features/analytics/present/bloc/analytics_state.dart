part of 'analytics_bloc.dart';

@freezed
abstract class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState.initial() = _Initial;
  const factory AnalyticsState.loading() = _Loading;
  const factory AnalyticsState.loaded({
    required VisitorStatsEntity stats,
    required List<VisitorEntity> visitors,
  }) = _Loaded;
  const factory AnalyticsState.failure({required ErrorInfo apiErrorModel}) =
      _Failure;
}
