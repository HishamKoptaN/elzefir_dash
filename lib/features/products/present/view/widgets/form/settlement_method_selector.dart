import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alzefr_dash/core/widgets/forms/custom_text_form_field.dart';
import 'package:alzefr_dash/core/widgets/forms/labeled_field.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_price_variant_entity.dart';
import 'package:alzefr_dash/features/settlement_methods/domain/entities/settlement_method_entity.dart';

class SettlementMethodSelector extends StatelessWidget {
  final List<SettlementMethodEntity> allMethods;
  final List<SettlementMethodEntity> selectedMethods;
  final List<ProductPriceVariantEntity> priceVariants;
  final Function(List<SettlementMethodEntity>, List<ProductPriceVariantEntity>)
      onChanged;

  const SettlementMethodSelector({
    super.key,
    required this.allMethods,
    required this.selectedMethods,
    required this.priceVariants,
    required this.onChanged,
  });

  String _getPrice(String settlementMethodId) {
    return priceVariants
            .firstWhere(
              (v) => v.settlementMethodId == settlementMethodId,
              orElse: () => const ProductPriceVariantEntity(
                settlementMethodId: '',
                price: '',
              ),
            )
            .price ??
        '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طرق التسوية المتاحة',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        // Display selected methods as Badges (Chips) with price input
        if (selectedMethods.isNotEmpty) ...[
          ...selectedMethods.map((method) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: Chip(
                      label: Text(method.title),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () {
                        final newSelection = List<SettlementMethodEntity>.from(
                          selectedMethods,
                        )..removeWhere((m) => m.id == method.id);
                        final newPriceVariants =
                            List<ProductPriceVariantEntity>.from(priceVariants)
                              ..removeWhere(
                                (v) => v.settlementMethodId == method.id,
                              );
                        onChanged(newSelection, newPriceVariants);
                      },
                    ),
                  ),
                  SizedBox(width: 8.w),
                  SizedBox(
                    width: 100.w,
                    child: CustomTextFormField(
                      width: .infinity,
                      initialValue: _getPrice(method.id),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(hintText: 'السعر'),
                      onChanged: (value) {
                        final newPriceVariants =
                            List<ProductPriceVariantEntity>.from(priceVariants);
                        final index = newPriceVariants.indexWhere(
                          (v) => v.settlementMethodId == method.id,
                        );
                        if (index != -1) {
                          newPriceVariants[index] = ProductPriceVariantEntity(
                            settlementMethodId: method.id,
                            price: value,
                          );
                        } else {
                          newPriceVariants.add(
                            ProductPriceVariantEntity(
                              settlementMethodId: method.id,
                              price: value,
                            ),
                          );
                        }
                        onChanged(selectedMethods, newPriceVariants);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: 8.h),
        ],
        // Dropdown to add more methods
        DropdownButtonFormField<SettlementMethodEntity>(
          decoration: const InputDecoration(
            labelText: 'إضافة طريقة تسوية',
            border: OutlineInputBorder(),
          ),
          items: allMethods
              .where((m) => !selectedMethods.any((s) => s.id == m.id))
              .map(
                (method) => DropdownMenuItem<SettlementMethodEntity>(
                  value: method,
                  child: Text(method.title),
                ),
              )
              .toList(),
          onChanged: (method) {
            if (method != null) {
              final newSelection = List<SettlementMethodEntity>.from(
                selectedMethods,
              )..add(method);
              final newPriceVariants = List<ProductPriceVariantEntity>.from(
                priceVariants,
              )..add(
                  ProductPriceVariantEntity(
                    settlementMethodId: method.id,
                    price: '',
                  ),
                );
              onChanged(newSelection, newPriceVariants);
            }
          },
          value: null,
        ),
      ],
    );
  }
}
