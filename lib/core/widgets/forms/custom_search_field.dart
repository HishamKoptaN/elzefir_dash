import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/device_helper.dart';
import 'custom_text_form_field.dart';

class CustomSearchWidget extends StatelessWidget {
  final String initialValue;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final double? width;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomSearchWidget({
    super.key,
    required this.initialValue,
    this.hintText = 'بحث...',
    this.onChanged,
    this.onClear,
    this.width,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: AppResponsive.responsive(
        context,
        mobile: width ?? double.infinity,
        tablet: (width ?? 700.w) * 1.3,
        desktop: (width ?? 700.w) * 1.5,
      ),
      child: CustomTextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFDFDFDF), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF003A46), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFDFDFDF), width: 1),
          ),
          prefixIcon:
              prefixIcon ??
              Icon(
                Icons.search,
                size: AppResponsive.responsive(
                  context,
                  mobile: 80.r,
                  tablet: 35.r,
                  desktop: 35.r,
                ),

                color: const Color(0xFF878790),
              ),
          suffixIcon:
              suffixIcon ??
              (initialValue.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        size: AppResponsive.responsive(
                          context,
                          mobile: 80.r,
                          tablet: 35.r,
                          desktop: 35.r,
                        ),
                        color: const Color(0xFF878790),
                      ),
                      onPressed: onClear,
                    )
                  : null),
        ),
      ),
    );
  }
}
