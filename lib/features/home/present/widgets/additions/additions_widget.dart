import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../products/domain/entities/product_entity.dart';
import 'addition_card.dart';

class AdditionsSection extends StatelessWidget {
  const AdditionsSection({super.key, required this.additions});
  final List<AdditionEntity> additions;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          runSpacing: 10.h,
          alignment: .center,
          children: additions.map((addition) {
            return AdditionCard(addition: addition);
          }).toList(),
        );
      },
    );
  }
}
