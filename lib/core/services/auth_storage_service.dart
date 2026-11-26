import 'package:injectable/injectable.dart';

import '../di/dependency_injection.dart';
import '../di/dio/api_module.dart';
import 'token_store.dart';

@Injectable()
class AuthStorageService {
  Future<void> storeJwtToken(String token) async {
    await createTokenStore().write(token);
    await getIt<AuthInterceptor>().updateToken();
  }

  Future<void> clear() => createTokenStore().clear();

  Future<void> updateAuthToken() async {
    await getIt<AuthInterceptor>().updateToken();
  }
}
