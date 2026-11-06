part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.get() = _Get;
  const factory HomeEvent.selectCategoryId({required int? id}) =
      _SelectCategoryId;
}
