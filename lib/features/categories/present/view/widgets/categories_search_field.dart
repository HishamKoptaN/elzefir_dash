import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

class CategoriesSearchField extends StatefulWidget {
  const CategoriesSearchField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<CategoriesSearchField> createState() => _CategoriesSearchFieldState();
}

class _CategoriesSearchFieldState extends State<CategoriesSearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          widget.onChanged(value);
          setState(() {});
        },
        textAlign: .right,
        textDirection: .rtl,
        style: context.textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: 'ابحث عن تصنيف...',
          hintStyle: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          isDense: true,
          contentPadding: .symmetric(horizontal: 16.r, vertical: 12.r),
          constraints: const BoxConstraints(
            minHeight: kMinInteractiveDimension,
          ),
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: _controller.text.isEmpty
              ? null
              : IconButton(
                  tooltip: 'مسح البحث',
                  onPressed: () {
                    _controller.clear();
                    widget.onChanged('');
                    setState(() {});
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
          border: OutlineInputBorder(borderRadius: .circular(16.r)),
        ),
      ),
    );
  }
}
