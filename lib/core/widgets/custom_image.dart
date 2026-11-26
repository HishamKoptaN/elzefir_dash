import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions/responsive_icon_extension.dart';
import '../utils/storage_url.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    this.aspectRatio,
    this.fit = BoxFit.cover,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.backgroundColor = const Color(0xffF5F5F5),
  });

  final String image;
  final double? aspectRatio;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final Color backgroundColor;

  String get _resolvedImage {
    return resolveStoredImageUrl(image);
  }

  bool get _isNetwork {
    return _resolvedImage.startsWith('http://') ||
        _resolvedImage.startsWith('https://') ||
        _resolvedImage.startsWith('blob:') ||
        _resolvedImage.startsWith('data:');
  }

  bool get _isFile =>
      _resolvedImage.startsWith('/') || _resolvedImage.startsWith('file://');
  @override
  Widget build(BuildContext context) {
    final Widget imageWidget = _isNetwork
        ? CachedNetworkImage(
            imageUrl: _resolvedImage,
            fit: fit,
            placeholder: (_, _) {
              return _placeholder();
            },
            errorWidget: (_, _, _) {
              return _errorWidget();
            },
          )
        : _isFile
        ? Image.file(
            File(_resolvedImage),
            fit: fit,
            matchTextDirection: true,
            errorBuilder: (_, _, _) {
              return _errorWidget();
            },
          )
        : Image.asset(
            _resolvedImage,
            fit: fit,
            matchTextDirection: true,
            errorBuilder: (_, _, _) {
              return _errorWidget();
            },
          );

    Widget content = ClipRRect(borderRadius: borderRadius, child: imageWidget);
    if (aspectRatio != null) {
      content = AspectRatio(aspectRatio: aspectRatio!, child: content);
    }

    return SizedBox(child: content);
  }

  Widget _placeholder() {
    return Container(
      color: backgroundColor,
      alignment: Alignment.center,
      child: SizedBox(
        height: 22.h,
        width: 22.w,
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  Widget _errorWidget() {
    return Container(
      color: backgroundColor,
      alignment: Alignment.center,
      child: Icon(Icons.broken_image_outlined, size: 34.iconRes),
    );
  }
}
