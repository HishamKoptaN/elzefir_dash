import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_input/phone_input_package.dart';

/// الدول المدعومة في حقول الهاتف داخل التطبيق.
const List<IsoCode> supportedPhoneCountries = <IsoCode>[
  IsoCode.EG,
  IsoCode.SA,
  IsoCode.CM,
  IsoCode.TZ,
  IsoCode.UG,
  IsoCode.MW,
  IsoCode.MZ,
];

/// قواعد التحقق الموحّدة لأرقام الهواتف.
PhoneNumberInputValidator buildPhoneValidator() {
  return PhoneValidator.compose([
    PhoneValidator.required(errorText: 'مطلوب'),
    PhoneValidator.validMobile(errorText: 'رقم الهاتف غير صحيح'),
    PhoneValidator.valid(),
    PhoneValidator.validCountry(supportedPhoneCountries),
    PhoneValidator.validType(
      PhoneNumberType.mobile,
      errorText: 'نوع الهاتف غير صحيح',
    ),
  ]);
}

/// نافذة اختيار الدولة الموحّدة، بألوان مأخوذة من الثيم.
CountrySelectorNavigator buildPhoneCountryNavigator(ColorScheme colorScheme) {
  return CountrySelectorNavigator.draggableBottomSheet(
    minChildSize: 0.4,
    maxChildSize: 0.7,
    initialChildSize: 0.6,
    countries: supportedPhoneCountries,
    favorites: supportedPhoneCountries,
    addFavoriteSeparator: true,
    showCountryCode: true,
    noResultMessage: 'لا توجد نتائج',
    showSearchInput: true,
    searchInputDecoration: InputDecoration(
      hintText: 'بحث',
      contentPadding: .symmetric(horizontal: 10.w),
    ),
    defaultSearchInputIconColor: colorScheme.primary,
    bottomSheetDragHandlerColor: colorScheme.primary,
    scrollPhysics: const BouncingScrollPhysics(),
    flagSize: 50.r,
    flagShape: BoxShape.rectangle,
    showCountryName: true,
    showCountryFlag: true,
    searchInputHeight: 50.h,
  );
}

/// نمط النص الموحّد لحقل الهاتف وقائمة الدول.
TextStyle buildPhoneTextStyle(ColorScheme colorScheme) {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24.sp,
    color: colorScheme.onSurface,
  );
}
