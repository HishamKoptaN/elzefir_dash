import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';
import 'package:alzefr_dash/core/widgets/forms/custom_text_form_field.dart';
import 'package:alzefr_dash/core/widgets/forms/form_save_button.dart';
import 'package:alzefr_dash/core/widgets/forms/form_section_card.dart';
import 'package:alzefr_dash/core/widgets/forms/image_picker_field.dart';
import 'package:alzefr_dash/core/widgets/forms/labeled_field.dart';
import '../../../domain/entities/category_upsert_req_entity.dart';
import '../../blocs/category_upsert_bloc/category_upsert_bloc.dart';

class CategoryUpsertForm extends StatelessWidget {
  const CategoryUpsertForm({
    super.key,
    required this.req,
    required this.status,
    required this.isNew,
  });

  final CategoryUpsertReqEntity req;
  final FormzSubmissionStatus status;
  final bool isNew;

  void _changed(CategoryUpsertReqEntity updated) {
    getIt<CategoryUpsertBloc>().add(
      CategoryUpsertEvent.dataChanged(categoryUpsertReq: updated),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: .all(16.r),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Column(
                  spacing: 16.h,
                  children: [
                    ImagePickerField(
                      label: 'صورة التصنيف',
                      image:
                          req.imageFile?.value?.path ??
                          req.imageUrl?.value ??
                          '',
                      onPicked: (file) {
                        return _changed(
                          req.copyWith(
                            // Keep the picked file itself: its name and mime type
                            // are what the upload link is generated from.
                            imageFile: XFileFormInput.dirty(file),
                          ),
                        );
                      },
                    ),
                    FormSectionCard(
                      icon: Icons.info_outline_rounded,
                      tint: context.colorScheme.primary,
                      title: 'معلومات التصنيف',
                      subtitle: 'الاسم كما يظهر في التصنيفات داخل المنيو',
                      children: [
                        LabeledField(
                          label: 'اسم التصنيف',
                          required: true,
                          child: CustomTextFormField(
                            width: .infinity,
                            initialValue: req.name?.value,
                            decoration: InputDecoration(
                              hintText: 'مثال: أسماك بالكيلو',
                              errorText: (req.name?.value.trim().isEmpty ??
                                      true)
                                  ? 'هذا الحقل مطلوب'
                                  : null,
                            ),
                            onChanged: (value) {
                              return _changed(
                                req.copyWith(
                                  name: GenericFormInput.dirty(value: value),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Container(
            padding: .fromLTRB(16.w, 10.h, 16.w, 12.h),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              border: Border(
                top: BorderSide(color: context.colorScheme.outline),
              ),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.primary.withValues(alpha: 0.06),
                  offset: const Offset(0, -2),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('إلغاء'),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: FormSaveButton(
                    label: isNew ? 'إضافة التصنيف' : 'حفظ التعديلات',
                    status: status,
                    onPressed: () {
                      getIt<CategoryUpsertBloc>().add(
                        const CategoryUpsertEvent.upsert(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
