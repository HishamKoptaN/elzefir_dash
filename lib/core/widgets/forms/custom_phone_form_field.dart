import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phone_input/phone_input_package.dart';

import '../../utils/extensions/theme_ext.dart';
import 'phone/custom_phone_form_field_config.dart';

/// حقل هاتف موحّد يطبّق قواعد الدولة والتحقق والتنسيق في مكان واحد.
class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({
    super.key,
    required this.onChanged,
    this.initialValue,
    this.enabled = true,
    this.isCountrySelectionEnabled = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.focusNode,
    this.flagSize = 34,
    this.decoration,
    this.defaultCountry = IsoCode.SA,
    this.autocorrect = false,
    this.autofillHints = const [AutofillHints.telephoneNumber],
    this.showFlagInInput = true,
    this.showArrow = true,
    this.shouldFormat = false,
    this.flagShape = BoxShape.rectangle,
    this.keyboardType = TextInputType.phone,
    this.inputFormatters,
    this.countryCodeStyle,
    this.style,
  });

  final ValueChanged<PhoneNumber?> onChanged;
  final PhoneNumber? initialValue;
  final bool enabled;
  final bool isCountrySelectionEnabled;
  final AutovalidateMode autovalidateMode;
  final FocusNode? focusNode;
  final double flagSize;
  final InputDecoration? decoration;
  final IsoCode defaultCountry;
  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final bool showFlagInInput;
  final bool showArrow;
  final bool shouldFormat;
  final BoxShape flagShape;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? countryCodeStyle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return PhoneInput(
      initialValue: initialValue,
      enabled: enabled,
      onChanged: onChanged,
      autocorrect: autocorrect,
      flagSize: flagSize,
      autofillHints: autofillHints,
      showFlagInInput: showFlagInInput,
      isCountrySelectionEnabled: isCountrySelectionEnabled && enabled,
      showArrow: showArrow,
      shouldFormat: shouldFormat,
      flagShape: flagShape,
      defaultCountry: defaultCountry,
      decoration: (decoration ?? const InputDecoration()).copyWith(
        hintText: 'رقم الهاتف',
        hintTextDirection: TextDirection.rtl,
        prefixIcon: FaIcon(FontAwesomeIcons.phone, size: 20.r),
        counterText: '',
        errorMaxLines: 2,
      ),
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      validator: buildPhoneValidator(),
      countrySelectorNavigator: buildPhoneCountryNavigator(colorScheme),
      keyboardType: keyboardType,
      inputFormatters:
          inputFormatters ??
          [FilteringTextInputFormatter.allow(RegExp(r'^[0-9+\-\s\(\)]+$'))],
      countryCodeStyle: countryCodeStyle ?? buildPhoneTextStyle(colorScheme),
      style: style ?? buildPhoneTextStyle(colorScheme),
    );
  }
}
