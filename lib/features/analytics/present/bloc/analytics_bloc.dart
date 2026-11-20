import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/entities/visitor_entity.dart';
import '../../domain/entities/visitor_stats_entity.dart';
import '../../domain/usecases/analytics_use_cases.dart';
part 'analytics_bloc.freezed.dart';
part 'analytics_event.dart';
part 'analytics_state.dart';

@singleton
class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final AnalyticsUseCases useCases;

  bool _watching = false;
  VisitorStatsEntity _stats = const VisitorStatsEntity();
  List<VisitorEntity> _visitors = const <VisitorEntity>[];

  AnalyticsBloc(this.useCases) : super(const .initial()) {
    on<AnalyticsEvent>(
      (event, emit) async {
        await event.when(
          watch: () async {
            if (_watching) {
              return;
            }
            _watching = true;
            emit(const .loading());
            await _fetchVisitors();
            await emit.forEach<VisitorStatsEntity>(
              useCases.watchVisitorStats(),
              onData: (stats) {
                _stats = stats;
                return AnalyticsState.loaded(
                  stats: stats,
                  visitors: _visitors,
                );
              },
              onError: (Object error, StackTrace stackTrace) {
                return AnalyticsState.failure(
                  apiErrorModel: ErrorHandler.handle(error, stackTrace),
                );
              },
            );
          },
          refresh: () async {
            await _fetchVisitors();
            emit(
              AnalyticsState.loaded(stats: _stats, visitors: _visitors),
            );
          },
        );
      },
      transformer: concurrent(),
    );
    add(const .watch());
  }

  Future<void> _fetchVisitors() async {
    final result = await useCases.getTopVisitors(limit: 5);
    _visitors = result.mapOrNull(
          success: (success) {
            return success.data;
          },
        ) ??
        const <VisitorEntity>[];
  }
}
