/// Host that serves the backend public disk (the `/storage/…` files).
///
/// This is deliberately separate from the API base URL in `EnvConfig`: the
/// dashboard API runs on a different server from the uploaded images.
const String storageHostUrl = 'https://beige-elk-309228.hostingersite.com';

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
  // Guard against paths that already carry the disk prefix
  // (`storage/products/x.png`), so the URL never doubles `/storage/storage/`.
  final path = value.replaceFirst(RegExp(r'^/+'), '').replaceFirst(
    RegExp(r'^storage/'),
    '',
  );
  return '${storageBaseUrl()}$path';
}

/// Root of the backend public disk holding the uploaded files.
String storageBaseUrl() {
  return '$storageHostUrl/storage/';
}
