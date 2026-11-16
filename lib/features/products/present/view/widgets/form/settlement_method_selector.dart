import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../settlement_methods/domain/entities/settlement_method_entity.dart';

class SettlementMethodSelector extends StatelessWidget {
  final List<SettlementMethodEntity> allMethods;
  final List<SettlementMethodEntity> selectedMethods;
  final Function(List<SettlementMethodEntity>) onChanged;

  const SettlementMethodSelector({
    super.key,
    required this.allMethods,
    required this.selectedMethods,
    required this.onChanged,
  });

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
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: allMethods.map((method) {
            final isSelected = selectedMethods.any((m) => m.id == method.id);
            return FilterChip(
              label: Text(method.title),
              selected: isSelected,
              onSelected: (selected) {
                final newSelection = List<SettlementMethodEntity>.from(
                  selectedMethods,
                );
                if (selected) {
                  newSelection.add(method);
                } else {
                  newSelection.removeWhere((m) => m.id == method.id);
                }
                onChanged(newSelection);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
