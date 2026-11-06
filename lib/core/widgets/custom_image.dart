import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/extensions/responsive_icon_extension .dart';

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

  bool get _isNetwork {
    return image.startsWith('http://') || image.startsWith('https://');
  }

  bool get _isFile => image.startsWith('/') || image.startsWith('file://');
  @override
  Widget build(BuildContext context) {
    final Widget imageWidget = _isNetwork
        ? CachedNetworkImage(
            imageUrl: image,
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
            File(image),
            fit: fit,
            matchTextDirection: true,
            errorBuilder: (_, _, _) {
              return _errorWidget();
            },
          )
        : Image.asset(
            image,
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
