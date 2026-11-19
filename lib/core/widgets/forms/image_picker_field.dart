import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/extensions/theme_ext.dart';
import '../custom_image.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField({
    super.key,
    required this.image,
    required this.label,
    required this.onPicked,
    this.height = 220,
  });

  final String image;
  final String label;
  final ValueChanged<XFile> onPicked;
  final double height;

  Future<void> _pick() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (file != null) {
      onPicked(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8.h,
      children: [
        Text(label, style: context.textTheme.titleMedium),
        InkWell(
          onTap: () {
            _pick();
          },
          borderRadius: .circular(14.r),
          child: Container(
            height: height.h,
            width: .infinity,
            clipBehavior: .antiAlias,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: .circular(14.r),
              border: Border.all(
                color: context.colorScheme.onSurface.withValues(alpha: 0.12),
              ),
            ),
            child: image.isEmpty
                ? Column(
                    mainAxisAlignment: .center,
                    spacing: 8.h,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 40.r,
                        color: context.colorScheme.primary,
                      ),
                      Text(
                        'اضغط لإضافة صورة',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  )
                : Stack(
                    fit: .expand,
                    children: [
                      CustomImage(
                        image: image,
                        fit: .cover,
                        borderRadius: .circular(14.r),
                      ),
                      Positioned(
                        bottom: 8.h,
                        right: 8.w,
                        child: FilledButton.tonalIcon(
                          onPressed: () {
                            _pick();
                          },
                          icon: const Icon(Icons.camera_alt_outlined),
                          label: const Text('تغيير الصورة'),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}