import 'package:package_info_plus/package_info_plus.dart';

/// يعرض إصدار لوحة المطعم بالصيغة نفسها على كل المنصات.
class AppVersion {
  const AppVersion._();

  /// يُقرأ مرة واحدة ويُعاد استخدامه في كل مكان يعرض الإصدار.
  static final Future<String> display = _read();

  static Future<String> _read() async {
    final info = await PackageInfo.fromPlatform();
    return format(info.version, info.buildNumber);
  }

  /// دالة نقية لتسهيل اختبار الصيغة دون الاعتماد على المنصة.
  static String format(String version, String buildNumber) {
    if (version.isEmpty) {
      return '';
    }
    return buildNumber.isEmpty ? version : '$version+$buildNumber';
  }
}
