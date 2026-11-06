import 'package:flutter/material.dart';

import 'render_image_component.dart';

class FlutterRenderImage extends RenderImageComponent<Widget> {
  @override
  Widget build({
    required String path,
    required double height,
    required double width,
    double? fit,
  }) {
    return Image.asset(path, fit: BoxFit.cover, height: height);
  }
}
