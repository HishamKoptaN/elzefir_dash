import 'package:image_picker/image_picker.dart';

/// File type the backend should issue the upload link for, without the dot.
///
/// Picked files expose their extension through `name` on desktop and mobile,
/// but web blob names can be extension-less, so the mime type is used as a
/// fallback and anything unknown is reported instead of being guessed.
String imageFileExtension(XFile image) {
  final fromName = _afterLastDot(image.name);
  if (fromName != null) return fromName;

  final fromPath = _afterLastDot(image.path);
  if (fromPath != null) return fromPath;

  final subtype = image.mimeType?.split('/').last.toLowerCase();
  final fromMime = _mimeExtensions[subtype];
  if (fromMime != null) return fromMime;

  throw FormatException('Cannot detect the image type of ${image.name}');
}

String? _afterLastDot(String value) {
  final index = value.lastIndexOf('.');
  if (index <= -1 || index == value.length - 1) return null;
  final extension = value.substring(index + 1).toLowerCase();
  return _mimeExtensions.containsKey(extension) ? extension : null;
}

/// Extensions the backend accepts, keyed also by the mime subtypes that map to
/// them.
const Map<String, String> _mimeExtensions = {
  'jpg': 'jpg',
  'jpeg': 'jpeg',
  'png': 'png',
  'webp': 'webp',
  'gif': 'gif',
  'avif': 'avif',
};
