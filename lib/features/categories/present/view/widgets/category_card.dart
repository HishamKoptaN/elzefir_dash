import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';
import 'package:alzefr_dash/core/widgets/custom_image.dart';
import 'package:alzefr_dash/features/home/present/widgets/editing_btn.dart';
import '../../../domain/entities/categories_res_entity.dart';
import '../upsert_category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryEntity category;

  void _openEdit(BuildContext context) {
    context.pushNamed(UpsertCategoryView.routeName, extra: category);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: .symmetric(horizontal: 16.w, vertical: 6.h),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: .circular(14.r)),
      child: ListTile(
        onTap: () {
          return _openEdit(context);
        },
        contentPadding: .symmetric(horizontal: 16.w, vertical: 8.h),
        leading: SizedBox(
          width: 56.w,
          height: 56.w,
          child: category.image.isEmpty
              ? CircleAvatar(
                  backgroundColor: context.colorScheme.primary.withValues(
                    alpha: 0.08,
                  ),
                  child: Icon(
                    Icons.category_outlined,
                    color: context.colorScheme.primary,
                  ),
                )
              : CustomImage(image: category.image, borderRadius: .circular(12.r)),
        ),
        title: Text(
          category.name,
          style: context.textTheme.titleMedium,
        ),
        subtitle: Text(
          'اضغط للتعديل',
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        trailing: CustomOutlinedButton(
          text: 'تعديل',
          icon: Icons.edit_outlined,
          onTap: () {
            return _openEdit(context);
          },
        ),
      ),
    );
  }
}