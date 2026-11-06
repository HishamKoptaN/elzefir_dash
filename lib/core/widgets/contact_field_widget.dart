import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ContactFieldWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool showButton;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final bool isEditing;
  final bool isLoading;
  final Function(String)? onChanged;
  final bool phoneOnly;

  const ContactFieldWidget({
    super.key,
    required this.title,
    required this.value,
    this.showButton = false,
    this.buttonText = 'تعديل',
    this.onButtonPressed,
    this.isEditing = false,
    this.onChanged,
    this.phoneOnly = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 1055.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Gap(20.w),
                    if (isEditing)
                      Expanded(
                        child: TextFormField(
                          initialValue: value,
                          onChanged: onChanged,
                          keyboardType: phoneOnly
                              ? TextInputType.phone
                              : TextInputType.text,
                          inputFormatters: phoneOnly
                              ? [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(12),
                                ]
                              : null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF3D42DF)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: const Color(0xFF696974),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    else
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: const Color(0xFF696974),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (showButton)
            Center(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: FilledButton.icon(
                  onPressed: onButtonPressed,
                  icon: Icon(Icons.edit_rounded, size: 18.r),
                  label: Text(
                    'تعديل ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
