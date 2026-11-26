import 'package:flutter/material.dart';
import 'package:form_inputs/form_inputs.dart';

import '../../../../../../../../../core/di/dependency_injection.dart';
import '../../../../../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../../../../../core/widgets/forms/custom_text_form_field.dart';
import '../../../../../../../../../core/widgets/forms/labeled_field.dart';
import '../../../../../domain/entities/product_upsert_req_entity.dart';
import '../../../../blocs/product_upsert_bloc/product_upsert_bloc.dart';

/// وحدة بيع المنتج كما تظهر للمستخدم (كجم / طبق / قطعة).
/// تركها فارغة يعني «كجم» في الموقع.
class ProductPriceUnitField extends StatelessWidget {
  const ProductPriceUnitField({super.key, required this.req});

  final ProductUpsertReqEntity req;

  @override
  Widget build(BuildContext context) {
    return LabeledField(
      label: 'وحدة البيع',
      child: CustomTextFormField(
        width: .infinity,
        initialValue: req.priceUnit?.value,
        decoration: InputDecoration(
          hintText: 'كجم / طبق / قطعة (افتراضي: كجم)',
          suffixStyle: context.textTheme.labelLarge,
        ),
        onChanged: (value) {
          getIt<ProductUpsertBloc>().add(
            ProductUpsertEvent.dataChanged(
              productUpsertReq: req.copyWith(
                priceUnit: GenericFormInput.dirty(value: value),
              ),
            ),
          );
        },
      ),
    );
  }
}
