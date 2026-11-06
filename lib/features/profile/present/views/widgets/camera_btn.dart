import 'dart:ui';

import 'package:flutter/material.dart';


class CameraButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;

  const CameraButton({super.key, this.onPressed, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Icon(Icons.camera_alt, size: size * 0.5, color: Colors.black),
      ),
    );
  }
}
