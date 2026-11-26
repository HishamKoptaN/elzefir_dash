part of 'category_upsert_bloc.dart';

@freezed
abstract class CategoryUpsertEvent with _$CategoryUpsertEvent {
  const factory CategoryUpsertEvent.upsert() = _Upsert;
  const factory CategoryUpsertEvent.reset() = _Reset;
  const factory CategoryUpsertEvent.dataChanged({
    required CategoryUpsertReqEntity categoryUpsertReq,
  }) = _DataChanged;
}
