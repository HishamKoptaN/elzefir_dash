import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:gap/gap.dart';
import 'package:phone_input/phone_input_package.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../auth_sizes.dart';
import '../../../widgets/auth_page_layout.dart';
import '../../../widgets/custom_auth_text_form_field.dart';
import '../bloc/sign_up_bloc.dart';
import '../../../widgets/debug_auto_fill.dart';
import 'widgets/sign_up_actions.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const String routeName = 'sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
    return DebugAutoFill(
      child: Scaffold(
        body: BlocConsumer<SignUpBloc, SignUpState>(
          bloc: getIt<SignUpBloc>(),
          listener: (context, state) async {
            await state.whenOrNull(
              failure: (aiErrorModel) {
                AppSnackBar.show(
                  context: context,
                  title: aiErrorModel.title,
                  message: aiErrorModel.message,
                  type: AppSnackBarType.error,
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (signUpReq, formzSubmissionStatus) {
                return AuthPageLayout(
                  title: 'تسجيل حساب',
                  form: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 6.h,
                    children: [
                      CustomAuthTextFormField(
                        key: const Key('name_field'),
                        initialValue: signUpReq.name?.value,
                        onChanged: (v) {
                          getIt<SignUpBloc>().add(
                            SignUpEvent.dataChanged(
                              signUpReq: signUpReq.copyWith(
                                name: GenericFormInput.dirty(value: v!),
                              ),
                            ),
                          );
                        },
                        hintText: 'الاسم',
                        prefixIcon: Icons.person_outline,
                        autofillHints: const [AutofillHints.name],
                        validator: (v) {
                          return GenericFormInput.dirty(
                            value: v ?? '',
                            minLength: 9,
                            maxLength: 15,
                            errorMessages: const {
                              GenericValidationError.empty: 'يرجى إدخال الاسم',
                              GenericValidationError.short: 'الاسم قصير جدًا',
                              GenericValidationError.long: 'الاسم طويل جدًا',
                            },
                          ).errorMessage;
                        },
                      ),
                      CustomAuthTextFormField(
                        key: const Key('email_field'),
                        initialValue: signUpReq.email?.value,
                        hintText: 'البريد الإلكتروني',
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                        onChanged: (v) {
                          getIt<SignUpBloc>().add(
                            SignUpEvent.dataChanged(
                              signUpReq: signUpReq.copyWith(
                                email: EmailFormInput.dirty(v!),
                              ),
                            ),
                          );
                        },
                        validator: (v) {
                          return EmailFormInput.dirty(v ?? '', [
                            'gmail.com',
                            'icloud.com',
                          ]).errorMessage;
                        },
                      ),
                      CustomAuthTextFormField(
                        key: const Key('username_field'),
                        initialValue: signUpReq.username?.value,
                        hintText: 'اسم المستخدم',
                        prefixIcon: Icons.account_circle,
                        keyboardType: TextInputType.text,
                        autofillHints: const [AutofillHints.username],
                        onChanged: (v) {
                          getIt<SignUpBloc>().add(
                            SignUpEvent.dataChanged(
                              signUpReq: signUpReq.copyWith(
                                username: UsernameFormInput.dirty(v ?? ''),
                              ),
                            ),
                          );
                        },
                        validator: (v) {
                          return UsernameFormInput.dirty(v ?? '').errorMessage;
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 12.h,
                        children: [
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
                                  data: const IconThemeData(
                                    color: Colors.black,
                                  ),
                                  child: PhoneInput(
                                    defaultCountry: IsoCode.SA,
                                    onChanged: (phoneNumber) {
                                      getIt<SignUpBloc>().add(
                                        SignUpEvent.dataChanged(
                                          signUpReq: signUpReq.copyWith(
                                            phoneNumber: GenericFormInput.dirty(
                                              value: phoneNumber?.nsn ?? '',
                                            ),
                                            isoCode: GenericFormInput.dirty(
                                              value:
                                                  phoneNumber?.isoCode.name ??
                                                  '',
                                            ),
                                            dialCode: GenericFormInput.dirty(
                                              value:
                                                  phoneNumber?.countryCode ??
                                                  '',
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
                                    autofillHints: [
                                      AutofillHints.telephoneNumber,
                                    ],
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
                                      PhoneValidator.required(
                                        errorText: 'مطلوب',
                                      ),
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
                                          searchInputDecoration:
                                              InputDecoration(
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
                            message:
                                _phoneIsTouched &&
                                    signUpReq.isValidNumber == false
                                ? "رقم الهاتف غير صحيح أو غير مطابق لكود الدولة"
                                : null,
                            type: signUpReq.isValidNumber == true
                                ? AuthMessageType.success
                                : AuthMessageType.error,
                          ),
                        ],
                      ),
                      CustomAuthTextFormField(
                        key: const Key('password_field'),
                        initialValue: signUpReq.password?.value,
                        onChanged: (v) {
                          getIt<SignUpBloc>().add(
                            SignUpEvent.dataChanged(
                              signUpReq: signUpReq.copyWith(
                                password: PasswordFormInput.dirty(v!),
                              ),
                            ),
                          );
                        },
                        onToggleObscure: () {
                          getIt<SignUpBloc>().add(
                            SignUpEvent.dataChanged(
                              signUpReq: signUpReq.copyWith(
                                obscurePassword:
                                    !(signUpReq.obscurePassword ?? false),
                              ),
                            ),
                          );
                        },
                        hintText: 'كلمة المرور',
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: signUpReq.obscurePassword ?? true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        isPassword: true,
                        obscureText: signUpReq.obscurePassword ?? true,
                        showPasswordToggle: true,
                        validator: (v) {
                          return PasswordFormInput.dirty(
                            v ?? '',
                            true,
                          ).errorMessage;
                        },
                      ),
                      Container(
                        width: AuthSizes.fieldWidth(context),
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildPasswordRequirement(
                              context: context,
                              text: 'رمز واحد على الأقل (!@#\$%^&*...)',
                              isSatisfied:
                                  signUpReq.password?.hasSymbol ?? false,
                            ),
                            _buildPasswordRequirement(
                              context: context,
                              text: 'حرف كبير واحد على الأقل (A-Z)',
                              isSatisfied:
                                  signUpReq.password?.value != null &&
                                  signUpReq.password!.value.contains(
                                    RegExp(r'[A-Z]'),
                                  ),
                            ),
                            _buildPasswordRequirement(
                              context: context,
                              text: 'حرف صغير واحد على الأقل (a-z)',
                              isSatisfied:
                                  signUpReq.password?.value != null &&
                                  signUpReq.password!.value.contains(
                                    RegExp(r'[a-z]'),
                                  ),
                            ),
                            _buildPasswordRequirement(
                              context: context,
                              text: 'رقم واحد على الأقل (0-9)',
                              isSatisfied:
                                  signUpReq.password?.hasNumber ?? false,
                            ),
                            _buildPasswordRequirement(
                              context: context,
                              text: '8 أحرف و أرقام على الأقل',
                              isSatisfied:
                                  signUpReq.password?.value != null &&
                                  signUpReq.password!.value.length >= 8,
                            ),
                          ],
                        ),
                      ),
                      Gap(8.h),
                      CustomAuthTextFormField(
                        key: const Key('confirm_password_field'),
                        initialValue: signUpReq.confirmPassword?.value,
                        onChanged: (v) {
                          getIt<SignUpBloc>().add(
                            SignUpEvent.dataChanged(
                              signUpReq: signUpReq.copyWith(
                                confirmPassword: ConfirmPasswordFormInput.dirty(
                                  value: v ?? '',
                                  password: signUpReq.password?.value ?? '',
                                ),
                              ),
                            ),
                          );
                        },
                        onToggleObscure: () {
                          getIt<SignUpBloc>().add(
                            SignUpEvent.dataChanged(
                              signUpReq: signUpReq.copyWith(
                                obscurePassword:
                                    !(signUpReq.obscurePassword ?? false),
                              ),
                            ),
                          );
                        },
                        hintText: 'تأكيد كلمة المرور',
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: signUpReq.obscurePassword ?? true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        obscureText: signUpReq.obscurePassword ?? true,
                        showPasswordToggle: true,

                        authMessageType:
                            signUpReq.confirmPassword?.isValid ?? false
                            ? AuthMessageType.success
                            : AuthMessageType.error,
                        message: signUpReq.confirmPassword?.isValid ?? false
                            ? 'مطابقة'
                            : signUpReq.confirmPassword?.errorMessage,
                        validator: (v) {
                          return ConfirmPasswordFormInput.dirty(
                            value: v ?? '',
                            password: signUpReq.password?.value ?? '',
                          ).errorMessage;
                        },
                      ),
                      Gap(10.h),
                      SignUpActions(
                        signUpReq: signUpReq,
                        formzSubmissionStatus: formzSubmissionStatus,
                      ),
                      Gap(10.h),
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
      ),
    );
  }

  Widget _buildPasswordRequirement({
    required BuildContext context,
    required String text,
    required bool isSatisfied,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: isSatisfied ? Colors.green : Colors.grey[600],
              fontWeight: isSatisfied ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class DebugGap extends StatelessWidget {
  final double height;

  const DebugGap(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.red.withOpacity(.15),
      alignment: Alignment.center,
      child: Text(
        '${height.toStringAsFixed(1)} px',
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
