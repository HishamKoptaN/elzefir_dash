import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:phone_input/phone_input_package.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/routing/utils/navigation_service.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../auth_sizes.dart';
import '../../../widgets/auth_page_layout.dart';
import '../../../widgets/custom_auth_btn.dart';
import '../../../widgets/custom_auth_text_form_field.dart';
import '../../otp_view.dart';
import '../blocs/bloc/sign_in_bloc.dart';

class PhoneSignInView extends StatefulWidget {
  const PhoneSignInView({super.key});
  static const String routeName = 'phone-number';

  @override
  State<PhoneSignInView> createState() => _PhoneSignInViewState();
}

class _PhoneSignInViewState extends State<PhoneSignInView> {
  late FocusNode _phoneFocusNode;
  bool _phoneIsTouched = false;
  @override
  void initState() {
    super.initState();
    _phoneFocusNode = FocusNode();
    _phoneFocusNode.addListener(_handlePhoneFocusChange);
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  void _handlePhoneFocusChange() {
    if (!_phoneFocusNode.hasFocus) {
      _phoneIsTouched = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'تسجيل الدخول برقم الهاتف',
      body: BlocConsumer<SignInBloc, SignInState>(
        bloc: getIt<SignInBloc>(),
        listener: (context, state) {
          state.mapOrNull(
            success: (state) {
              NavigationService.pushNamed(
                context: context,
                routeName: OtpView.routeName,
              );
            },
            failure: (state) {
              context.showErrorSnackBar(
                title: 'فشل',
                message: state.apiError.message,
              );
            },
          );
        },

        builder: (context, state) {
          return state.maybeWhen(
            loaded: (signIn, formzSubmissionStatus) {
              return AuthPageLayout(
                title: ' تسجيل الدخول برقم الهاتف',
                form: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12.h,
                  children: [
                    Text(
                      '*سوف نرسل لك رسالة بها رمز التحقق الخاص بك',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                        height: 25 / 22,
                        letterSpacing: -0.06,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    Gap(80.h),
                    Container(
                      height: AuthSizes.fieldHeight(context),
                      width: AuthSizes.fieldWidth(context),
                      decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
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
                              defaultCountry: IsoCode.SA,
                              onChanged: (phoneNumber) {
                                getIt<SignInBloc>().add(
                                  SignInEvent.dataChanged(
                                    signIn: signIn.copyWith(
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
                              flagSize: 34,
                              autofillHints: [AutofillHints.telephoneNumber],
                              showFlagInInput: true,
                              isCountrySelectionEnabled: true,
                              showArrow: true,
                              shouldFormat: false,
                              flagShape: BoxShape.rectangle,
                              decoration: authFieldDecoration(
                                hintText: 'رقم الهاتف',
                                prefixIcon: Icon(Icons.phone, size: 20),
                                hintTextDirection: TextDirection.rtl,
                              ),
                              autovalidateMode: AutovalidateMode.disabled,
                              focusNode: _phoneFocusNode,
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
                                    searchInputDecoration: InputDecoration(
                                      hintText: 'بحث',
                                      contentPadding: .symmetric(
                                        horizontal: 10.w,
                                      ),
                                    ),
                                    defaultSearchInputIconColor:
                                        context.colorScheme.primary,
                                    bottomSheetDragHandlerColor:
                                        context.colorScheme.primary,
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
                                    flagSize: 50.sp,
                                    flagShape: BoxShape.rectangle,
                                    showCountryName: true,
                                    showCountryFlag: true,
                                    searchInputHeight: 50.h,
                                    countryCodeStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 28.sp,
                                      color: Colors.black,
                                    ),
                                    countryNameStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 28.sp,
                                      color: Colors.black,
                                    ),
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
                      message: _phoneIsTouched && signIn.isValidNumber == false
                          ? "رقم الهاتف غير صحيح أو غير مطابق لكود الدولة"
                          : null,
                      type: signIn.isValidNumber == true
                          ? AuthMessageType.success
                          : AuthMessageType.error,
                    ),
                    customAuthBtn(
                      title: 'ارسال الكود',
                      context: context,
                      onPressed: signIn.isValidNumber == true
                          ? () {
                              getIt<SignInBloc>().add(
                                const SignInEvent.verify(),
                              );
                              // NavigationService.goNamed(
                              //   context: context,
                              //   routeName: OtpView.routeName,
                              // );
                              // AuthService.verifyPhoneNumber(
                              //   context,
                              //   "+201120332361",
                              // );
                            }
                          : null,
                      formzSubmissionStatus: formzSubmissionStatus.isInProgress
                          ? formzSubmissionStatus
                          : signIn.isValidNumber == true
                          ? FormzSubmissionStatus.success
                          : FormzSubmissionStatus.initial,
                    ),
                    Gap(150.h),
                  ],
                ),
              );
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
