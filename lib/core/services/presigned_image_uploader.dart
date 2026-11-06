import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../features/profile/domain/entities/presigned_url_entity.dart';

/// Result of a successful upload, as reported by the backend.
class UploadedImage {
  const UploadedImage({required this.filePath, this.publicUrl});

  /// Path to store in Firestore (relative to the backend public disk).
  final String filePath;
  final String? publicUrl;
}

/// Posts a picked image to the upload link the backend handed out.
///
/// Shared by every feature that stores images (products, categories, ...): the
/// link is issued per resource, but sending the bytes to it is the same call.
///
/// Uses its own Dio instance: the link is an absolute URL on the backend host,
/// not something the API base path should prefix.
@lazySingleton
class PresignedImageUploader {
  PresignedImageUploader(@Named('s3Dio') Dio dio) : _dio = dio;

  final Dio _dio;

  Future<UploadedImage> upload({
    required PresignedUrlEntity link,
    required XFile image,
  }) async {
    final uploadUrl = link.uploadUrl;
    final filePath = link.filePath;
    if (uploadUrl == null || filePath == null) {
      throw const FormatException(
        'Upload link is missing its url or file path',
      );
    }

    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        await image.readAsBytes(),
        // The name picked from the device can be empty (data-backed files) or
        // extension-less (web blobs); PHP then treats the part as a plain field
        // instead of an upload. The backend already named the destination file,
        // so reuse it to keep the part and the link in agreement.
        filename: _fileNameOf(filePath),
      ),
      'path': filePath,
      'expires_at': link.expiresAt,
      'token': link.token,
    });

    final response = await _dio.post<dynamic>(
      uploadUrl,
      data: formData,
      options: Options(
        contentType: 'multipart/form-data; boundary=${formData.boundary}',
        headers: {'Accept': 'application/json'},
      ),
    );

    final body = _asMap(response.data);
    final storedPath = body['file_path'] as String? ?? filePath;
    return UploadedImage(
      filePath: storedPath,
      publicUrl: body['public_url'] as String?,
    );
  }

  /// Last segment of a storage path, used as the multipart file name.
  static String _fileNameOf(String filePath) {
    final segments = Uri.parse(filePath).pathSegments;
    return segments.isEmpty ? 'image' : segments.last;
  }

  static Map<String, dynamic> _asMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is String && data.trim().isNotEmpty) {
      final decoded = jsonDecode(data);
      if (decoded is Map<String, dynamic>) return decoded;
    }
    return const {};
  }
}
