import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/widgets/forms/custom_text_form_field.dart';
import 'package:alzefr_dash/core/widgets/forms/form_save_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: .all(16.r),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            spacing: 20.h,
            children: [
              ImagePickerField(
                label: 'صورة التصنيف',
                image: req.imageFile?.value?.path ?? req.imageUrl?.value ?? '',
                onPicked: (file) {
                  getIt<CategoryUpsertBloc>().add(
                    CategoryUpsertEvent.dataChanged(
                      categoryUpsertReq: req.copyWith(
                        // Keep the picked file itself: its name and mime type
                        // are what the upload link is generated from.
                        imageFile: XFileFormInput.dirty(file),
                      ),
                    ),
                  );
                },
              ),
              LabeledField(
                label: 'اسم التصنيف',
                child: CustomTextFormField(
                  width: .infinity,
                  initialValue: req.name?.value,
                  decoration: const InputDecoration(
                    hintText: 'مثال: وجبات رئيسية',
                  ),
                  onChanged: (value) {
                    getIt<CategoryUpsertBloc>().add(
                      CategoryUpsertEvent.dataChanged(
                        categoryUpsertReq: req.copyWith(
                          name: GenericFormInput.dirty(value: value),
                        ),
                      ),
                    );
                  },
                ),
              ),
              FormSaveButton(
                label: isNew ? 'إضافة التصنيف' : 'حفظ التعديلات',
                status: status,
                onPressed: () {
                  getIt<CategoryUpsertBloc>().add(
                    const CategoryUpsertEvent.upsert(),
                  );
                },
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}