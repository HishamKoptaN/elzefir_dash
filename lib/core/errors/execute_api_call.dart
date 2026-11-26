import '../networking/api_result.dart';
import 'error_handler.dart';

Future<ApiResult<T>> executeApiCall<T>(Future<T> Function() action) async {
  try {
    final result = await action();
    return ApiResult.success(data: result);
  } catch (error, stackTrace) {
    return ApiResult.failure(errorInfo: ErrorHandler.handle(error, stackTrace));
  }
}
