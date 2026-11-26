import 'package:flutter/material.dart';

import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';
import 'package:alzefr_dash/core/widgets/forms/form_section_card.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_upsert_req_entity.dart';

import '../../../blocs/product_upsert_bloc/product_upsert_bloc.dart';

/// يحدد ما يظهر في واجهة الزبون: الأطباق المميزة، والطبق الذي يحمل شارة
/// «الأكثر طلباً». القيم تُكتب إلى حقول isFeatured / isMostRequested في
/// مستند المنتج بفايرستور، وهي نفس الحقول التي يقرأها الموقع العام.
class ProductFlagsFields extends StatelessWidget {
  const ProductFlagsFields({super.key, required this.req});

  final ProductUpsertReqEntity req;

  void _changed({bool? featured, bool? mostRequested}) {
    getIt<ProductUpsertBloc>().add(
      ProductUpsertEvent.dataChanged(
        productUpsertReq: req.copyWith(
          isFeatured: featured ?? req.isFeatured,
          isMostRequested: mostRequested ?? req.isMostRequested,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return FormSectionCard(
      icon: Icons.local_fire_department_outlined,
      tint: colors.primary,
      title: 'ظهور المنتج في الموقع',
      subtitle: 'اختر ما يظهر في الواجهة وما الذي يحمل شارة الأكثر طلباً',
      children: [
        _tile(
          context: context,
          value: req.isFeatured ?? false,
          title: 'طبق مميز',
          subtitle: 'يظهر في شريط الأطباق المميزة والشريط المتحرك',
          onChanged: (value) => _changed(featured: value),
        ),
        _tile(
          context: context,
          value: req.isMostRequested ?? false,
          title: 'الأكثر طلباً',
          subtitle: 'يظهر أولاً ويحمل شارة «الأكثر طلباً» في الموقع',
          onChanged: (value) => _changed(mostRequested: value),
        ),
      ],
    );
  }

  /// ListTile يرسم تأثيراته على أقرب Material، وبطاقة القسم ترسم خلفية
  /// فوقها، لذلك نعزل كل مفتاح داخل Material شفاف حتى لا تختفي التأثيرات.
  Widget _tile({
    required BuildContext context,
    required bool value,
    required String title,
    required String subtitle,
    required ValueChanged<bool> onChanged,
  }) {
    return Material(
      color: context.colorScheme.surface.withValues(alpha: 0),
      child: SwitchListTile(
        value: value,
        contentPadding: EdgeInsets.zero,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: onChanged,
      ),
    );
  }
}
