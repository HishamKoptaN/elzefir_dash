import 'package:alzefr_dash/config/env_config.dart';

/// Turns the image value stored in Firestore into something a widget can load.
///
/// Uploaded product images are saved as a public-disk relative path
/// (`products/7-04fb230b-….png`), while bundled art lives under `assets/…` and
/// picked or absolute files already carry their own scheme. Only the relative
/// storage paths need the backend `/storage/` prefix.
String resolveStoredImageUrl(String image) {
  final value = image.trim();
  if (value.isEmpty) return value;
  if (Uri.parse(value).hasScheme) return value;
  if (value.startsWith('/') || value.startsWith('assets/')) return value;
  return '${storageBaseUrl()}$value';
}

/// Root of the backend public disk, derived from the configured API base so it
/// follows the environment the dashboard runs against.
String storageBaseUrl() {
  final api = Uri.parse(EnvConfig.config.baseUrl);
  return '${api.scheme}://${api.authority}/storage/';
}
