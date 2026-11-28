import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:phone_input/phone_input_package.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/forms/custom_phone_form_field.dart';
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
          decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: IconTheme(
                data: IconThemeData(color: context.colorScheme.onSurface),
                child: CustomPhoneFormField(
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
                  flagSize: 45.sp,
                  decoration: authFieldDecoration(hintText: 'رقم الهاتف'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
