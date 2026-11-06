class ApiConstants {
  //! Auth
  static const String check = "check";
  static const String authToken = "auth-token";
  static const String login = "login";
  static const String logout = "logout";
  //! Apis
  static const String home = "home";
  //! orders
  static const String filters = "filters";
  static const String orders = "orders";
  static const String ordersStats = "orders/stats";
  static const String chart = "orders/chart";
  static const String roles = "roles";
  static const String invoices = "invoices";
  static const String receiptVouchers = "receipt-vouchers";
  static const String paymentVouchers = "payment-vouchers";
  static const String permissions = "permissions";
  static const String users = "users";
  static const String distributionCountries = "distribution-countries";
  static const String notifications = "notifications";
  static const String ordersStatuses = "orders/statuses";
  static const String profile = "profile";
  static const String settings = "settings";
  static const String products = "products";
  static const String categories = "categories";
  static const String externalNotifications = "external-notifications";
  static const String pusherAppKey = "729b05a6dc271c331b44";
  static const String pusherCluster = "eu";
  static const String pusherHost = "api-eu.pusherapp.com";
  static const String sallaUnifiedValues = "salla-unified-values";
  static const bool pusherEncrypted = true;
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
