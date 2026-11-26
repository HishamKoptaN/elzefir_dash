part of 'category_upsert_bloc.dart';

@freezed
abstract class CategoryUpsertState with _$CategoryUpsertState {
  const factory CategoryUpsertState.initial() = _Initial;
  const factory CategoryUpsertState.loaded({
    CategoryUpsertReqEntity? categoryUpsertReq,
    required FormzSubmissionStatus formzSubmissionStatus,
  }) = _Loaded;
  const factory CategoryUpsertState.loading() = _Loading;
  const factory CategoryUpsertState.success() = _Success;
  const factory CategoryUpsertState.failure({
    required ErrorInfo apiErrorModel,
  }) = _Failure;
}
