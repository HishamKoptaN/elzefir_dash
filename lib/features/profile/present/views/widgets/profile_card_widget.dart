import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/extensions/device_type_extension.dart';
import '../../../../../core/widgets/camera_button_widget.dart';

class ProfileCardWidget extends StatelessWidget {
  final String name;
  final String username;
  final String? imageUrl;
  final VoidCallback? onImageSelected;
  final File? selectedImage;
  final Function(String)? onNameChanged;
  final Function(String)? onUserNameChanged;
  final bool isEditing;

  const ProfileCardWidget({
    super.key,
    required this.name,
    required this.username,
    this.imageUrl,
    this.onImageSelected,
    this.selectedImage,
    this.onNameChanged,
    this.onUserNameChanged,
    this.isEditing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      width: context.isDesk ? 1116.w : double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.only(top: 25.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4FB),
        border: Border.all(color: const Color(0xFF3D42DF), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: context.isDesk
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                avatar(),
                Gap(7.5.w),
                DataWidget(
                  isEditing: isEditing,
                  name: name,
                  onNameChanged: onNameChanged,
                  username: username,
                  onUserNameChanged: onUserNameChanged,
                ),
                Spacer(),
              ],
            )
          : Column(
              mainAxisAlignment: .spaceEvenly,
              crossAxisAlignment: .center,
              spacing: 5.h,
              children: [
                Gap(5.h),
                avatar(),
                DataWidget(
                  isEditing: isEditing,
                  name: name,
                  onNameChanged: onNameChanged,
                  username: username,
                  onUserNameChanged: onUserNameChanged,
                ),
              ],
            ),
    );
  }

  Widget avatar() {
    return Stack(
      children: [
        _buildAvatarImage(),
        if (isEditing)
          Positioned(
            bottom: 5.h,
            right: 5.w,
            child: CameraButton(
              size: 32.w,
              onPressed: () {
                onImageSelected?.call();
              },
            ),
          ),
      ],
    );
  }

  //  CircleAvatar(
  //       radius: radius,
  //       backgroundColor: Colors.black,
  //       child: CircleAvatar(
  //         radius: radius - 2,
  //         backgroundImage: profile.avatar != null
  //             ? NetworkImage(profile.avatar!)
  //             : null,
  //         child: profile.avatar == null
  //             ? const Icon(Icons.person, size: 50)
  //             : null,
  //       ),
  //     )
  Widget _buildAvatarImage() {
    ImageProvider? avatarImage;
    if (selectedImage != null) {
      avatarImage = FileImage(selectedImage!);
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      avatarImage = NetworkImage(
        '$imageUrl?t=${DateTime.now().millisecondsSinceEpoch}',
      );
    }
    final double radius = 50;
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: radius - 2,
        // width: 140.w,
        // height: 140.h,
        // decoration: BoxDecoration(
        //   color: LightColors().primary,
        //   shape: BoxShape.circle,
        //   image:
        // ),
        backgroundImage: avatarImage != null ? NetworkImage(imageUrl!) : null,
        child: avatarImage == null
            ? Center(
                child: FaIcon(
                  FontAwesomeIcons.circleUser,
                  color: Colors.white,
                  size: 50,
                ),
              )
            : null,
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.isEditing,
    required this.name,
    required this.onNameChanged,
    required this.username,
    required this.onUserNameChanged,
  });

  final bool isEditing;
  final String name;
  final Function(String)? onNameChanged;
  final String username;
  final Function(String)? onUserNameChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: context.isDesk ? .start : .center,
        mainAxisSize: MainAxisSize.min,
        spacing: isEditing ? 10.h : 0.h,
        children: [
          NameWidget(
            name: name,
            onNameChanged: onNameChanged,
            isEditing: isEditing,
          ),
          if (!isEditing)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                username,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          else
            TextFormField(
              initialValue: username,
              onChanged: onUserNameChanged,
              enabled: isEditing,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                filled: isEditing,
                fillColor: isEditing
                    ? Colors.white.withValues(alpha: 0.5)
                    : Colors.transparent,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: isEditing ? 12.w : 0,
                  vertical: 8.h,
                ),
                border: OutlineInputBorder(
                  borderSide: isEditing
                      ? BorderSide(color: const Color(0xFF3D42DF))
                      : BorderSide.none,
                ),
                hintText: "اسم المستخدم",
              ),
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
              validator: (v) {
                return UsernameFormInput.dirty(v ?? '').errorMessage;
              },
            ),
          Gap(14.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: const Color(0xFF3D42DF).withValues(alpha: 0.1),
            ),
            child: Text(
              'role',
              style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xFF3D42DF),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
    required this.name,
    required this.onNameChanged,
    required this.isEditing,
  });

  final String name;
  final Function(String)? onNameChanged;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w800,
      color: const Color(0xFF1A1A1A),
    );
    return !isEditing
        ? Text(name, style: textStyle)
        : TextFormField(
            initialValue: name,
            onChanged: onNameChanged,
            enabled: isEditing,
            textAlign: TextAlign.start,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              filled: isEditing,
              fillColor: isEditing
                  ? Colors.white.withValues(alpha: 0.5)
                  : Colors.transparent,
              contentPadding: EdgeInsets.symmetric(vertical: 8.h),
              border: OutlineInputBorder(
                borderSide: isEditing
                    ? BorderSide(color: const Color(0xFF3D42DF))
                    : BorderSide.none,
              ),
              hintText: "الاسم",
            ),
            style: textStyle,
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
          );
  }
}
