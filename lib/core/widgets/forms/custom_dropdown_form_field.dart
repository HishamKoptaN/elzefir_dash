import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/extensions/device_type_extension.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final double? height;
  final double? width;
  final T? initialValue;
  final String? labelText;
  final String? hintText;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final BoxDecoration? boxDecoration;
  final InputDecoration? inputDecoration;
  final Color? iconColor;
  final Color? dropdownColor;
  const CustomDropdownFormField({
    super.key,
    this.height,
    this.width,
    required this.items,
    required this.initialValue,
    required this.onChanged,
    this.labelText,
    this.hintText,
    this.validator,
    this.boxDecoration,
    this.inputDecoration,
    this.iconColor,
    this.dropdownColor,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: SizedBox(
        height: height ?? 60.h,
        width: width,
        child: DropdownButtonFormField<T>(
          padding: .symmetric(horizontal: 2),
          key: key,
          isExpanded: true,
          initialValue: initialValue,
          items: items,
          icon: Icon(Icons.arrow_drop_down, size: context.iconSize(size: 30)),
          hint: Text(hintText ?? '', style: TextStyle(fontSize: 20.sp)),
          onChanged: onChanged,
          validator: validator,
        ),
      ),
    );
  }
}
