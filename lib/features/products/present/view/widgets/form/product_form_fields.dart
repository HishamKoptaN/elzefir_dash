import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';

import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/widgets/forms/custom_text_form_field.dart';
import 'package:alzefr_dash/core/widgets/forms/labeled_field.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_upsert_req_entity.dart';
import 'package:alzefr_dash/features/products/present/blocs/product_upsert_bloc/product_upsert_bloc.dart';

import '../../../../../settlement_methods/domain/entities/settlement_method_entity.dart';
import 'category_dropdown.dart';
import 'settlement_method_selector.dart';

class ProductFormFields extends StatelessWidget {
  const ProductFormFields({
    super.key,
    required this.req,
    required this.availableMethods,
  });

  final ProductUpsertReqEntity req;
  final List<SettlementMethodEntity> availableMethods;

  void _changed(ProductUpsertReqEntity updated) {
    getIt<ProductUpsertBloc>().add(
      ProductUpsertEvent.dataChanged(productUpsertReq: updated),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        LabeledField(
          label: 'اسم المنتج',
          child: CustomTextFormField(
            width: .infinity,
            initialValue: req.name?.value,
            decoration: const InputDecoration(hintText: 'مثال: برجر دجاج'),
            onChanged: (value) {
              return _changed(
                req.copyWith(name: GenericFormInput.dirty(value: value)),
              );
            },
          ),
        ),
        LabeledField(
          label: 'الاسم الظاهر للزبائن',
          child: CustomTextFormField(
            width: .infinity,
            initialValue: req.title?.value,
            decoration: const InputDecoration(
              hintText: 'مثال: برجر دجاج مقرمش',
            ),
            onChanged: (value) {
              return _changed(
                req.copyWith(title: GenericFormInput.dirty(value: value)),
              );
            },
          ),
        ),
        LabeledField(
          label: 'وصف المنتج',
          child: CustomTextFormField(
            width: .infinity,
            maxLines: 3,
            initialValue: req.description?.value,
            decoration: const InputDecoration(
              hintText: 'مكونات المنتج أو أي تفاصيل تهم الزبون',
            ),
            onChanged: (value) {
              return _changed(
                req.copyWith(description: GenericFormInput.dirty(value: value)),
              );
            },
          ),
        ),
        LabeledField(
          label: 'السعر (ج.م)',
          child: CustomTextFormField(
            width: .infinity,
            initialValue: req.price?.value,
            keyboardType: const .numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9٠-٩.]')),
            ],
            decoration: const InputDecoration(hintText: 'مثال: 120'),
            onChanged: (value) {
              return _changed(
                req.copyWith(price: GenericFormInput.dirty(value: value)),
              );
            },
          ),
        ),
        CategoryDropdown(
          value: req.categoryId?.value,
          onChanged: (value) {
            return _changed(
              req.copyWith(categoryId: GenericFormInput.dirty(value: value)),
            );
          },
        ),
        SettlementMethodSelector(
          allMethods: availableMethods,
          selectedMethods: req.settlementMethods,
          priceVariants: req.priceVariants,
          onChanged: (methods, priceVariants) {
            return _changed(
              req.copyWith(
                settlementMethods: methods,
                priceVariants: priceVariants,
              ),
            );
          },
        ),
      ],
    );
  }
}
