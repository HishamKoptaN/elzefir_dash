import 'package:flutter/material.dart';

abstract class RenderImageComponent<T> {
  T build({
    required String path,
    required double height,
    required double width,
  });
}

class FlutterRenderImage extends RenderImageComponent<Widget> {
  @override
  Widget build({
    required String path,
    required double height,
    required double width,
  }) {
    return Image.asset(path, fit: BoxFit.cover);
  }
}
