import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'presigned_url_model.freezed.dart';
part 'presigned_url_model.g.dart';

@freezed
abstract class PresignedUrlModel with _$PresignedUrlModel {
  const factory PresignedUrlModel({
    @JsonKey(name: 'upload_url') String? uploadUrl,
    @JsonKey(name: 'file_path') String? filePath,
    @JsonKey(name: 'content_type') String? contentType,

    /// Unix seconds after which [uploadUrl] stops accepting the file.
    @JsonKey(name: 'expires_at') int? expiresAt,

    /// Signature the upload endpoint expects for [filePath].
    String? token,
  }) = _PresignedUrlModel;

  factory PresignedUrlModel.fromJson(Map<String, Object?> json) =>
      _$PresignedUrlModelFromJson(json);
}
