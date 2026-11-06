import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/routing/utils/navigation_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions/device_type_extension.dart';
import '../../../../core/widgets/bg_container_widget.dart';
import '../../../../core/widgets/contact_field_widget.dart';
import '../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../../core/widgets/feedback/error_content_widget.dart';
import '../../../auth/reset_password/present/views/reset_pass_view.dart';
import '../bloc/profile_bloc.dart';
import 'widgets/profile_card_widget.dart';
import 'package:universal_io/io.dart';
import 'widgets/profile_phone_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const String routeName = 'profile';
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future<File?> _selectImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (image != null && mounted) {
        return File(image.path);
      }
    } catch (e) {}
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: getIt<ProfileBloc>(),
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.showSuccessSnackBar(title: 'تم تحديث الملف الشخصي بنجاح');
          },
          failure: (apiErrorModel) {
            context.showErrorSnackBar(title: apiErrorModel.title ?? '');
          },
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return SingleChildScrollView(
              child: Skeletonizer(
                enabled: state.isLoading,
                child: Column(
                  spacing: 25.h,
                  children: [
                    ProfileCardWidget(
                      name:
                          state.updatedProfile?.name?.value ??
                          state.profile.name?.value ??
                          'غير محدد',
                      username:
                          state.updatedProfile?.username?.value ??
                          state.profile.username?.value ??
                          'غير محدد',
                      imageUrl: state.profile.avatar?.toString(),
                      selectedImage: state.updatedProfile?.selectedImage,
                      isEditing: state.updatedProfile != null,
                      onNameChanged: (value) {
                        getIt<ProfileBloc>().add(
                          ProfileEvent.dataChanged(
                            updatedProfile: state.updatedProfile!.copyWith(
                              name: GenericFormInput.dirty(value: value),
                            ),
                          ),
                        );
                      },
                      onUserNameChanged: (value) {
                        getIt<ProfileBloc>().add(
                          ProfileEvent.dataChanged(
                            updatedProfile: state.updatedProfile!.copyWith(
                              username: UsernameFormInput.dirty(value),
                            ),
                          ),
                        );
                      },
                      onImageSelected: () async {
                        getIt<ProfileBloc>().add(
                          ProfileEvent.dataChanged(
                            updatedProfile: state.profile.copyWith(
                              selectedImage: await _selectImage(),
                            ),
                          ),
                        );
                      },
                    ),
                    BgContainerWidget(
                      width: context.isDesk ? 1116.w : double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20.h,
                        children: [
                          Row(
                            children: [
                              Text(
                                'بيانات الاتصال',
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          ProfilePhoneWidget(
                            profile: state.profile,
                            updatedProfile: state.updatedProfile,
                          ),
                          if (state.updatedProfile == null)
                            ContactFieldWidget(
                              title: 'البريد الإلكتروني',
                              value: state.profile.email ?? '',
                              isEditing: state.updatedProfile != null,
                              onChanged: (value) {
                                getIt<ProfileBloc>().add(
                                  ProfileEvent.dataChanged(
                                    updatedProfile: state.updatedProfile!
                                        .copyWith(email: value),
                                  ),
                                );
                              },
                            ),
                          ContactFieldWidget(
                            title: 'كلمة المرور',
                            value: '******************',
                            showButton: true,
                            buttonText: 'تغير كلمة المرور',
                            onButtonPressed: () {
                              NavigationService.pushNamed(
                                context: context,
                                routeName: ResetPassView.routeName,
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 25.w,
                            children: [
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: FilledButton.icon(
                                  style: FilledButton.styleFrom(
                                    backgroundColor:
                                        (state.updatedProfile == null &&
                                                state.updatedProfile == null
                                            ? true
                                            : (state.updatedProfile?.isEdited(
                                                    original: state.profile,
                                                  ) ??
                                                  false))
                                        ? LightColors().primary
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    if (state.updatedProfile?.isEdited(
                                          original: state.profile,
                                        ) ??
                                        false) {
                                      getIt<ProfileBloc>().add(
                                        ProfileEvent.updateProfile(),
                                      );
                                    } else {
                                      getIt<ProfileBloc>().add(
                                        ProfileEvent.dataChanged(
                                          updatedProfile: state.profile,
                                        ),
                                      );
                                    }
                                  },
                                  icon: state.updatedProfile == null
                                      ? Icon(Icons.edit_rounded, size: 18.r)
                                      : Icon(Icons.check_rounded, size: 18.r),
                                  label:
                                      state.formzSubmissionStatus.isInProgress
                                      ? const CircularProgressIndicator()
                                      : Text(
                                          state.updatedProfile == null
                                              ? 'تعديل'
                                              : 'حفظ التغييرات',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                              if (state.updatedProfile != null)
                                OutlinedButton(
                                  onPressed: () {
                                    getIt<ProfileBloc>().add(
                                      const ProfileEvent.dataChanged(
                                        updatedProfile: null,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'إلغاء',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: (s) {
            getIt<ProfileBloc>().add(const ProfileEvent.getProfile());
            return const Center(child: CircularProgressIndicator());
          },
          failure: (state) {
            return CustomErrorWidget(
              message: state.apiErrorModel.message ?? '',
              onRetry: () =>
                  getIt<ProfileBloc>().add(const ProfileEvent.getProfile()),
              retryText: 'retry',
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
