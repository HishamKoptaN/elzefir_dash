import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:phone_input/phone_input_package.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../auth/widgets/custom_auth_text_form_field.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../bloc/profile_bloc.dart';

class ProfilePhoneWidget extends StatelessWidget {
  final ProfileEntity? profile;
  final ProfileEntity? updatedProfile;
  const ProfilePhoneWidget({
    super.key,
    required this.profile,
    required this.updatedProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 12.h,
      children: [
        Container(
          height: 150.h,
          width: 1116.w,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: IconTheme(
                data: const IconThemeData(color: Colors.black),
                child: PhoneInput(
                  initialValue: PhoneNumber(
                    isoCode: IsoCode.values.firstWhere(
                      (element) {
                        return element.name ==
                            profile?.isoCode?.value
                                .toString()
                                .toUpperCase()
                                .trim();
                      },
                      orElse: () {
                        return IsoCode.SA;
                      },
                    ),
                    nsn: profile?.phoneNumber?.value ?? '',
                  ),
                  enabled: updatedProfile != null,
                  defaultCountry: IsoCode.SA,
                  onChanged: (phoneNumber) {
                    getIt<ProfileBloc>().add(
                      ProfileEvent.dataChanged(
                        updatedProfile: updatedProfile!.copyWith(
                          phoneNumber: GenericFormInput.dirty(
                            value: phoneNumber?.nsn ?? '',
                          ),
                          isoCode: GenericFormInput.dirty(
                            value: phoneNumber?.isoCode.name ?? '',
                          ),
                          dialCode: GenericFormInput.dirty(
                            value: phoneNumber?.countryCode ?? '',
                          ),
                          isValidNumber:
                              phoneNumber?.isValid(
                                type: PhoneNumberType.mobile,
                              ) ??
                              false,
                        ),
                      ),
                    );
                  },
                  autocorrect: false,
                  flagSize: 45.sp,
                  autofillHints: [AutofillHints.telephoneNumber],
                  showFlagInInput: true,
                  isCountrySelectionEnabled: updatedProfile != null,
                  showArrow: true,
                  shouldFormat: false,
                  flagShape: BoxShape.rectangle,
                  decoration: authFieldDecoration(
                    hintText: 'رقم الهاتف',
                    prefixIcon: Icon(
                      Icons.phone,
                      // color: AppColors.primary,
                      size: 30.sp,
                    ),
                    hintTextDirection: TextDirection.rtl,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // focusNode: _phoneFocusNode,
                  validator: PhoneValidator.compose([
                    PhoneValidator.required(errorText: 'مطلوب'),
                    PhoneValidator.validMobile(
                      errorText: 'رقم الهاتف غير صحيح',
                    ),
                    PhoneValidator.valid(),
                    PhoneValidator.validCountry([
                      IsoCode.EG,
                      IsoCode.SA,
                      IsoCode.CM,
                      IsoCode.TZ,
                      IsoCode.UG,
                      IsoCode.MW,
                      IsoCode.MZ,
                    ]),
                    PhoneValidator.validType(
                      PhoneNumberType.mobile,
                      errorText: 'نوع الهاتف غير صحيح',
                    ),
                  ]),
                  countrySelectorNavigator:
                      CountrySelectorNavigator.draggableBottomSheet(
                        minChildSize: 0.4,
                        maxChildSize: 0.7,
                        initialChildSize: 0.6,
                        countries: [
                          IsoCode.EG,
                          IsoCode.SA,
                          IsoCode.CM,
                          IsoCode.TZ,
                          IsoCode.UG,
                          IsoCode.MW,
                          IsoCode.MZ,
                        ],
                        favorites: [
                          IsoCode.EG,
                          IsoCode.SA,
                          IsoCode.CM,
                          IsoCode.TZ,
                          IsoCode.UG,
                          IsoCode.MW,
                          IsoCode.MZ,
                        ],
                        addFavoriteSeparator: true,
                        showCountryCode: true,
                        noResultMessage: 'noResultMessage',
                        showSearchInput: true,
                        searchInputDecoration: const InputDecoration(
                          focusColor: Colors.white,
                          fillColor: Colors.white,
                          hintText: 'بحث',
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                       
                        defaultSearchInputIconColor: Colors.grey,
                        bottomSheetDragHandlerColor: Colors.grey,
                        scrollPhysics: const BouncingScrollPhysics(),
                        flagSize: 50.sp,
                        flagShape: BoxShape.rectangle,
                        showCountryName: true,
                        showCountryFlag: true,
                        searchInputHeight: 50.h,
                      ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9+\-\s\(\)]+$'),
                    ),
                  ],
                  countryCodeStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp,
                    color: Colors.black,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        ValidationErrorWidget(
          message: profile?.isValidNumber == false
              ? "رقم الهاتف غير صحيح أو غير مطابق لكود الدولة"
              : null,
          type: profile?.isValidNumber == true
              ? AuthMessageType.success
              : AuthMessageType.error,
        ),
      ],
    );
  }
}
