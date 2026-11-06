import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/extensions/theme_ext.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.initialValue,
    this.decoration,
    this.keyboardType,
    this.textInputType,
    this.textInputAction,
    this.obscureText = false,
    this.maxLines = 1,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.readOnly = false,
    this.width,
    this.height,
    this.onFieldSubmitted,
    this.focusNode,
    this.inputFormatters,
    this.enabled = true,
    this.autovalidateMode,
    this.style,
    this.textAlign,
  });
  final String? initialValue;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final double? width;
  final double? height;
  final ValueChanged<String?>? onFieldSubmitted;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  State<CustomTextFormField> createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _linkController;

  @override
  void initState() {
    super.initState();
    _linkController = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant CustomTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newValue = widget.initialValue ?? '';
    if (_linkController.text != newValue) {
      _linkController.value = TextEditingValue(
        text: newValue,
        selection: TextSelection.collapsed(offset: newValue.length),
      );
    }
  }

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }

  void clear() {
    _linkController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 332.w,
      // height: 45ss.h,
      child: TextFormField(
        controller: _linkController,
        keyboardType: widget.keyboardType ?? widget.textInputType,
        textInputAction: widget.textInputAction,
        obscureText: widget.obscureText,
        style: widget.style ?? context.textTheme.bodyLarge,
        textAlign: widget.textAlign ?? TextAlign.right,
        autovalidateMode: widget.autovalidateMode,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
        readOnly: widget.readOnly ?? false,
        enabled: widget.enabled,
        textDirection: TextDirection.rtl,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        inputFormatters: widget.inputFormatters,
        decoration: widget.decoration,
      ),
    );
  }
}
