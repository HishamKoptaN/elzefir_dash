part of 'analytics_bloc.dart';

@freezed
abstract class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent.watch() = _Watch;
  const factory AnalyticsEvent.refresh() = _Refresh;
}
