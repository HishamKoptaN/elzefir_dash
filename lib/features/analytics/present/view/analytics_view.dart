import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/feedback/error_content_widget.dart';
import '../bloc/analytics_bloc.dart';
import 'analytics_content.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});
  static const String routeName = 'analytics';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      bloc: getIt<AnalyticsBloc>(),
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return AnalyticsContent(
              stats: state.stats,
              visitors: state.visitors,
              onRefresh: () {
                getIt<AnalyticsBloc>().add(const .refresh());
              },
            );
          },
          failure: (state) {
            final message = state.apiErrorModel.message.trim();
            return CustomErrorWidget(
              message: message.isEmpty ? 'تعذّر تحميل التحليلات' : message,
              onRetry: () {
                getIt<AnalyticsBloc>().add(const .watch());
              },
            );
          },
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
