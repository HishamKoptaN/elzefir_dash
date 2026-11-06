import 'package:injectable/injectable.dart';

import '../globals/database/shared_pref_helper.dart';
import 'session_manager.dart';

@LazySingleton(as: SessionManager)
class SessionManagerImpl implements SessionManager {
  static const _rememberMeKey = 'remember_me';

  @override
  Future<void> setRememberMe(bool value) async {
    await SharedPrefHelper.setData(key: _rememberMeKey, value: value);
  }

  @override
  Future<bool> isRememberMeEnabled() async {
    return await SharedPrefHelper.getBool(key: _rememberMeKey);
  }

  @override
  Future<void> clearSession() async {
    await SharedPrefHelper.removeData(key: _rememberMeKey);
  }
}
