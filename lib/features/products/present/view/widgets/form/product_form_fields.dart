import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';

import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/utils/price_input.dart';
import 'package:alzefr_dash/core/widgets/forms/custom_text_form_field.dart';
import 'package:alzefr_dash/core/widgets/forms/form_section_card.dart';
import 'package:alzefr_dash/core/widgets/forms/labeled_field.dart';
import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';
import 'package:alzefr_dash/core/utils/app_currency.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_upsert_req_entity.dart';
import 'package:alzefr_dash/features/products/present/blocs/product_upsert_bloc/product_upsert_bloc.dart';

import 'category_dropdown.dart';
import 'price/product_price_unit_field.dart';

class ProductFormFields extends StatelessWidget {
  const ProductFormFields({super.key, required this.req});

  final ProductUpsertReqEntity req;

  void _changed(ProductUpsertReqEntity updated) {
    getIt<ProductUpsertBloc>().add(
      ProductUpsertEvent.dataChanged(productUpsertReq: updated),
    );
  }

  void _bumpPrice(double delta) {
    final current = parsePrice(req.price?.value ?? '') ?? 0;
    final next = (current + delta).clamp(0, maxProductPrice).toDouble();
    return _changed(
      req.copyWith(
        price: GenericFormInput.dirty(
          value: priceToText(next),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        FormSectionCard(
          icon: Icons.info_outline_rounded,
          tint: context.colorScheme.primary,
          title: 'معلومات المنتج الأساسية',
          subtitle: 'الاسم والوصف كما يظهران داخل المنيو',
          children: [
            LabeledField(
              label: 'اسم المنتج',
              required: true,
              child: CustomTextFormField(
                width: .infinity,
                initialValue: req.name?.value,
                decoration: InputDecoration(
                  hintText: 'مثال: بوري مشوي',
                  errorText: (req.name?.value.trim().isEmpty ?? true)
                      ? 'هذا الحقل مطلوب'
                      : null,
                ),
                onChanged: (value) {
                  return _changed(
                    req.copyWith(name: GenericFormInput.dirty(value: value)),
                  );
                },
              ),
            ),
            LabeledField(
              label: 'الاسم الظاهر للزبائن',
              required: true,
              child: CustomTextFormField(
                width: .infinity,
                initialValue: req.title?.value,
                decoration: InputDecoration(
                  hintText: 'مثال: بوري مشوي على الفحم',
                  errorText: (req.title?.value.trim().isEmpty ?? true)
                      ? 'هذا الحقل مطلوب'
                      : null,
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
              required: true,
              child: CustomTextFormField(
                width: .infinity,
                maxLines: 3,
                initialValue: req.description?.value,
                decoration: InputDecoration(
                  hintText: 'مكونات المنتج أو أي تفاصيل تهم الزبون',
                  errorText: (req.description?.value.trim().isEmpty ?? true)
                      ? 'هذا الحقل مطلوب'
                      : null,
                ),
                onChanged: (value) {
                  return _changed(
                    req.copyWith(
                      description: GenericFormInput.dirty(value: value),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        FormSectionCard(
          icon: Icons.payments_outlined,
          tint: context.colorScheme.secondary,
          title: 'السعر والتصنيف',
          subtitle: 'سعر البيع والتصنيف الإداري داخل المنيو',
          children: [
            LabeledField(
              label: 'السعر ($appCurrency)',
              required: true,
              child: Column(
                crossAxisAlignment: .start,
                spacing: 8.h,
                children: [
                  CustomTextFormField(
                    width: .infinity,
                    initialValue: req.price?.value,
                    keyboardType: const .numberWithOptions(decimal: true),
                    inputFormatters: [
                      const PriceDigitsInputFormatter(),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                    decoration: InputDecoration(
                      hintText: 'مثال: 120',
                      suffixText: appCurrency,
                      suffixStyle: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                      errorText: isValidPrice(req.price?.value ?? '')
                          ? null
                          : 'أدخل سعرًا صالحًا',
                    ),
                    onChanged: (value) {
                      return _changed(
                        req.copyWith(
                          price: GenericFormInput.dirty(value: value),
                        ),
                      );
                    },
                  ),
                  Wrap(
                    crossAxisAlignment: .center,
                    spacing: 8.w,
                    runSpacing: 4.h,
                    children: [
                      Text(
                        'تعديل سريع:',
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                      for (final delta in const [-10, 10, 20])
                        ActionChip(
                          label: Text(delta > 0 ? '+$delta' : '$delta'),
                          onPressed: () {
                            return _bumpPrice(delta.toDouble());
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
            ProductPriceUnitField(req: req),
            CategoryDropdown(
              value: req.categoryId?.value,
              onChanged: (value) {
                return _changed(
                  req.copyWith(categoryId: GenericFormInput.dirty(value: value)),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
