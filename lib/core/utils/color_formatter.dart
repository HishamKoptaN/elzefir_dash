import 'package:flutter/material.dart';

Color parseHex({required String? hexString}) {
  if (hexString == null || hexString.isEmpty) return Colors.transparent;

  try {
    String hex = hexString.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    if (hex.length == 8 && hex.startsWith('00')) {
      hex = 'FF${hex.substring(2)}';
    }

    return Color(int.parse('0x$hex'));
  } catch (e) {
    debugPrint("Error parsing color: $e");
    return Colors.transparent;
  }
}
