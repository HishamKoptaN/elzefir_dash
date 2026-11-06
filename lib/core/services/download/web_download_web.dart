import 'dart:typed_data';
import 'dart:html' as html;

dynamic _cachedDirectoryHandle;

Future<void> downloadPdfOnWeb(
  Uint8List pdfBytes,
  String fileName,
  bool useSystemPicker,
) async {
  try {
    if (useSystemPicker) {
      final directoryHandle = await _showDirectoryPicker();
      if (directoryHandle != null) {
        _cachedDirectoryHandle = directoryHandle;
        await _saveToDirectory(directoryHandle, pdfBytes, fileName);
        return;
      }
      _simpleDownload(pdfBytes, fileName);
      return;
    }
    if (_cachedDirectoryHandle != null) {
      await _saveToDirectory(_cachedDirectoryHandle, pdfBytes, fileName);
      return;
    }
    final directoryHandle = await _showDirectoryPicker();
    if (directoryHandle != null) {
      _cachedDirectoryHandle = directoryHandle;
      await _saveToDirectory(directoryHandle, pdfBytes, fileName);
      return;
    }
    _simpleDownload(pdfBytes, fileName);
  } catch (e) {
    _simpleDownload(pdfBytes, fileName);
  }
}

Future<dynamic> _showDirectoryPicker() async {
  try {
    return await (html.window as dynamic).showDirectoryPicker();
  } catch (e) {
    return null;
  }
}

Future<void> _saveToDirectory(
  dynamic directoryHandle,
  Uint8List pdfBytes,
  String fileName,
) async {
  final fileHandle = await directoryHandle.getFileHandle(
    fileName,
    create: true,
  );
  final writable = await fileHandle.createWritable();
  await writable.write(pdfBytes);
  await writable.close();
}

void _simpleDownload(Uint8List pdfBytes, String fileName) {
  final blob = html.Blob([pdfBytes], 'application/pdf');
  final url = html.Url.createObjectUrlFromBlob(blob);

  html.AnchorElement(href: url)
    ..setAttribute('download', fileName)
    ..click();

  html.Url.revokeObjectUrl(url);
}
