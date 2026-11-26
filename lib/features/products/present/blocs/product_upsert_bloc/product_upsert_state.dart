part of 'product_upsert_bloc.dart';

@freezed
abstract class ProductUpsertState with _$ProductUpsertState {
  const factory ProductUpsertState.initial() = _Initial;
  const factory ProductUpsertState.loaded({
    ProductUpsertReqEntity? productUpsertReq,
    required FormzSubmissionStatus formzSubmissionStatus,
    /// Set when a save attempt failed: the form stays loaded (with the admin's
    /// input intact) so the attempt can simply be retried.
    ErrorInfo? errorInfo,
  }) = _Loaded;
  const factory ProductUpsertState.loading() = _Loading;
  const factory ProductUpsertState.success() = _Success;
  const factory ProductUpsertState.failure({required ErrorInfo apiErrorModel}) =
      _Failure;
}
