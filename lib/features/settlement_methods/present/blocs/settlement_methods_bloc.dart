import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/models/error_info.dart';
import '../../domain/entities/settlement_method_entity.dart';
import '../../domain/repo/settlement_methods_repo.dart';

part 'settlement_methods_bloc.freezed.dart';
part 'settlement_methods_event.dart';
part 'settlement_methods_state.dart';

@lazySingleton
class SettlementMethodsBloc
    extends Bloc<SettlementMethodsEvent, SettlementMethodsState> {
  final SettlementMethodsRepo settlementMethodsRepo;

  SettlementMethodsBloc({required this.settlementMethodsRepo})
    : super(const SettlementMethodsState.initial()) {
    on<SettlementMethodsEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const SettlementMethodsState.loading());
          final result = await settlementMethodsRepo.getSettlementMethods();
          result.fold(
            (error) => emit(SettlementMethodsState.failure(errorInfo: error)),
            (methods) => emit(
              SettlementMethodsState.loaded(availableMethods: methods),
            ),
          );
        },
      );
    });
    // Immediately fetch settlement methods upon initialization
    add(const SettlementMethodsEvent.fetch());
  }
}
