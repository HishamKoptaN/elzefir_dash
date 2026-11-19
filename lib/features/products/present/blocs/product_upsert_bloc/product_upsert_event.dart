part of 'product_upsert_bloc.dart';

@freezed
class ProductUpsertEvent with _$ProductUpsertEvent {
  const factory ProductUpsertEvent.upsert() = _Upsert;
  const factory ProductUpsertEvent.reset() = _Reset;
  const factory ProductUpsertEvent.dataChanged({
    required ProductUpsertReqEntity productUpsertReq,
  }) = _DataChanged;
}
