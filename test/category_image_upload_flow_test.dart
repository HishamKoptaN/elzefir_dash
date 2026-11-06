import 'dart:convert';
import 'dart:typed_data';

import 'package:alzefr_dash/core/services/presigned_image_uploader.dart';
import 'package:alzefr_dash/features/categories/data/data_sources/categories_api.dart';
import 'package:alzefr_dash/features/profile/data/mappers/profile_model_mapper.dart';
import 'package:alzefr_dash/features/profile/data/models/presigned_url_req_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';

/// 1x1 transparent PNG.
final Uint8List _pngBytes = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==',
);

void main() {
  // Runs against a local backend: php artisan serve --host=0.0.0.0 --port=8000
  group('category upload link flow', () {
    const apiBase = 'http://127.0.0.1:8000/api/admin/';
    final api = CategoriesApi(
      Dio(
        BaseOptions(
          baseUrl: apiBase,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      ),
    );
    final uploader = PresignedImageUploader(Dio(BaseOptions()));

    test(
      'presigned link then upload puts the image under categories/',
      () async {
        final reachable = await _backendIsUp(apiBase);
        if (!reachable) {
          throw StateError('Backend is not reachable on $apiBase');
        }

        final link = (await api.presignedUrl(
          id: '7',
          presignedUrlReqModel: const PresignedUrlReqModel(
            extensionProperty: 'png',
          ),
        )).toEntity();

        expect(link.filePath, startsWith('categories/7-'));
        expect(link.uploadUrl, endsWith('/api/admin/upload'));
        expect(link.contentType, 'image/png');
        expect(link.token, isNotNull);

        final uploaded = await uploader.upload(
          link: link,
          image: XFile.fromData(
            _pngBytes,
            name: 'category.png',
            mimeType: 'image/png',
          ),
        );

        expect(uploaded.filePath, link.filePath);

        final served = await Dio().get<dynamic>(
          'http://127.0.0.1:8000/storage/${uploaded.filePath}',
          options: Options(responseType: ResponseType.bytes),
        );
        expect(served.statusCode, 200);
        expect((served.data as List<int>).length, _pngBytes.length);
      },
    );

    test(
      'the backend refuses to issue a link for an unsupported type',
      () async {
        if (!await _backendIsUp(apiBase)) return;
        await expectLater(
          api.presignedUrl(
            id: '7',
            presignedUrlReqModel: const PresignedUrlReqModel(
              extensionProperty: 'php',
            ),
          ),
          throwsA(isA<DioException>()),
        );
      },
    );
  });
}

Future<bool> _backendIsUp(String apiBase) async {
  try {
    final res = await Dio().get<dynamic>('${apiBase}test');
    return res.statusCode == 200;
  } on DioException catch (e) {
    return e.response != null;
  }
}
