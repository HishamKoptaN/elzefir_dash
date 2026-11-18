import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/widgets/forms/form_save_button.dart';
import 'package:alzefr_dash/core/widgets/forms/image_picker_field.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_upsert_req_entity.dart';

import '../../../blocs/product_upsert_bloc/product_upsert_bloc.dart';
import 'product_form_fields.dart';

class ProductUpsertForm extends StatelessWidget {
  const ProductUpsertForm({
    super.key,
    required this.req,
    required this.status,
    required this.isNew,
  });

  final ProductUpsertReqEntity req;
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
                label: 'صورة المنتج',
                image: req.imageFile?.value?.path ?? req.imageUrl?.value ?? '',
                onPicked: (file) {
                  getIt<ProductUpsertBloc>().add(
                    .dataChanged(
                      productUpsertReq: req.copyWith(
                        // Keep the picked file itself: its name and mime type
                        // are what the upload link is generated from.
                        imageFile: XFileFormInput.dirty(file),
                      ),
                    ),
                  );
                },
              ),
              ProductFormFields(req: req),
              FormSaveButton(
                label: isNew ? 'إضافة المنتج' : 'حفظ التعديلات',
                status: status,
                onPressed: () {
                  getIt<ProductUpsertBloc>().add(
                    const ProductUpsertEvent.upsert(),
                  );
                },
              ),
              if (status == FormzSubmissionStatus.failure ||
                  req.title?.isNotValid == true ||
                  req.description?.isNotValid == true)
                Text(
                  'أكمل الاسم الظاهر للزبائن والوصف وبقية الحقول المطلوبة، وأدخل سعرًا رقميًا صالحًا',
                  textAlign: .center,
                  style: Theme.of(context).textTheme.bodySmall
                      ?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
