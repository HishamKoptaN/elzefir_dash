import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_image.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image});

  final String image;

  void _openPreview(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'إغلاق',
      barrierColor: Colors.black87,
      pageBuilder: (_, _, _) {
        return SafeArea(
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 4,
                  child: CustomImage(image: image, fit: .contain),
                ),
              ),
              Positioned(
                top: 12.h,
                left: 12.w,
                child: IconButton.filledTonal(
                  tooltip: 'إغلاق',
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return _openPreview(context);
      },
      child: Container(
        color: context.colorScheme.secondary.withValues(alpha: 0.4),
        width: .infinity,
        child: Stack(
          fit: .expand,
          children: [
            CustomImage(image: image, fit: .cover),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: Container(
                padding: .all(6.r),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: .circular(20.r),
                ),
                child: Icon(Icons.zoom_in, size: 16.r, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}