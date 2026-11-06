abstract class SessionManager {
  Future<void> setRememberMe(bool value);

  Future<bool> isRememberMeEnabled();

  Future<void> clearSession();
}
