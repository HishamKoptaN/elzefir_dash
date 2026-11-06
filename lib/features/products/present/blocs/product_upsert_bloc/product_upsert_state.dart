part of 'product_upsert_bloc.dart';

@freezed
class ProductUpsertState with _$ProductUpsertState {
  const factory ProductUpsertState.initial() = _Initial;
  const factory ProductUpsertState.loaded({
    ProductUpsertReqEntity? productUpsertReq,
    required FormzSubmissionStatus formzSubmissionStatus,
  }) = _Loaded;
  const factory ProductUpsertState.loading() = _Loading;
  const factory ProductUpsertState.success() = _Success;
  const factory ProductUpsertState.failure({required ErrorInfo apiErrorModel}) =
      _Failure;
}
