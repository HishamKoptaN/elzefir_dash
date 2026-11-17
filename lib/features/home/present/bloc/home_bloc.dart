import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/errors/models/error_info.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/home_res_entity.dart';
import '../../domain/use_cases/home_use_cases.dart';
part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@singleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCases homeUseCases;
  HomeBloc({required this.homeUseCases}) : super(const .initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        get: () async {},
        selectCategoryId: (id) {
          state.mapOrNull(
            loaded: (loadedState) {
              emit(loadedState.copyWith(selectedCategoryId: id));
            },
          );
        },
      );
    });
  }
}
