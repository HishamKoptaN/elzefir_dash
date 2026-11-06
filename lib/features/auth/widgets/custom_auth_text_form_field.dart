import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../auth_sizes.dart';

enum AuthMessageType { error, success, warning, info }

class CustomAuthTextFormField extends StatefulWidget {
  final String? initialValue;
  final Function(String?)? onChanged;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool isPassword;
  final bool showPasswordToggle;
  final VoidCallback? onToggleObscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final double? height;
  final double? width;
  final int? maxLength;
  final Iterable<String>? autofillHints;
  final AuthMessageType? authMessageType;
  final String? message;
  const CustomAuthTextFormField({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.isPassword = false,
    this.showPasswordToggle = false,
    this.onToggleObscure,
    this.controller,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.height,
    this.width,
    this.maxLength,
    this.autofillHints,
    this.authMessageType,
    this.message,
  });

  @override
  State<CustomAuthTextFormField> createState() =>
      _CustomAuthTextFormFieldState();
}

class _CustomAuthTextFormFieldState extends State<CustomAuthTextFormField> {
  String? _errorText;
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _hasLostFocusOnce = false;
  TextDirection _textDirection = TextDirection.rtl;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _updateTextDirection(_controller.text);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomAuthTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialValue != oldWidget.initialValue &&
        widget.controller == null &&
        widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      _hasLostFocusOnce = true;
      _validateInput();
    }
  }

  void _validateInput() {
    if (!_hasLostFocusOnce) return;
    final error = widget.validator?.call(_controller.text);
    setState(() {
      _errorText = error;
    });
  }

  void _updateTextDirection(String text) {
    if (text.trim().isEmpty) {
      setState(() {
        _textDirection = TextDirection.rtl;
      });
      return;
    }
    int arabicCount = 0;
    int latinCount = 0;
    for (var i = 0; i < text.length; i++) {
      final codeUnit = text.codeUnitAt(i);
      if ((codeUnit >= 0x0600 && codeUnit <= 0x06FF) ||
          (codeUnit >= 0x0750 && codeUnit <= 0x077F) ||
          (codeUnit >= 0x08A0 && codeUnit <= 0x08FF)) {
        arabicCount++;
      } else if ((codeUnit >= 0x0041 && codeUnit <= 0x005A) ||
          (codeUnit >= 0x0061 && codeUnit <= 0x007A)) {
        latinCount++;
      }
    }

    setState(() {
      _textDirection = arabicCount >= latinCount
          ? TextDirection.rtl
          : TextDirection.ltr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 12.h,
      children: [
        SizedBox(
          height: AuthSizes.fieldHeight(context),
          width: AuthSizes.fieldWidth(context),
          child: TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: (value) {
              widget.onChanged?.call(value);
              _updateTextDirection(value);
              if (_hasLostFocusOnce) {
                Future.microtask(() => _validateInput());
              }
            },
            autofillHints: widget.autofillHints,
            textDirection: _textDirection,
            textAlign: _textDirection == TextDirection.rtl
                ? TextAlign.right
                : TextAlign.left,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            errorBuilder: (context, error) {
              return Text('');
            },
            decoration: authFieldDecoration(
              hintText: widget.hintText,
              prefixIcon: Icon(widget.prefixIcon),
              suffixIcon: IconButton(
                icon: Icon(widget.suffixIcon),
                onPressed: widget.onToggleObscure,
              ),
              onToggleObscure: widget.onToggleObscure,
            ),
          ),
        ),
        ValidationErrorWidget(
          message: widget.message ?? _errorText,
          type: widget.authMessageType ?? AuthMessageType.error,
        ),
      ],
    );
  }
}

class ValidationErrorWidget extends StatelessWidget {
  final String? message;
  final AuthMessageType type;
  const ValidationErrorWidget({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AuthSizes.fieldWidth(context),
      child: Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: message != null && message!.trim().isNotEmpty
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                spacing: 4.w,
                children: [
                  Icon(
                    type == AuthMessageType.error
                        ? Icons.error
                        : Icons.check_circle,
                    size: 18,
                    color: type == AuthMessageType.error
                        ? Colors.red
                        : Colors.green,
                  ),
                  Text(
                    message ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: type == AuthMessageType.error
                          ? Colors.red
                          : Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : SizedBox.shrink(),
      ),
    );
  }
}

InputDecoration authFieldDecoration({
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  void Function()? onToggleObscure,
  TextDirection? hintTextDirection,
  EdgeInsetsGeometry? contentPadding,
  bool? isDense,
}) {
  return InputDecoration(
    hintText: hintText,

    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,

    hintTextDirection: hintTextDirection ?? TextDirection.rtl,
    counterText: '',
    errorMaxLines: 2,
    isDense: isDense,
  );
}
