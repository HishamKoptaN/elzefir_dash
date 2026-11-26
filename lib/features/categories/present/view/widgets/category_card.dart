import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';
import 'package:alzefr_dash/core/widgets/feedback/confirm_delete_dialog.dart';
import 'package:alzefr_dash/core/widgets/custom_image.dart';
import 'package:alzefr_dash/features/home/present/widgets/editing_btn.dart';
import '../../../domain/entities/categories_res_entity.dart';
import '../../blocs/bloc/categories_bloc.dart';
import '../upsert_category_view.dart';

/// كارت تصنيف بأسلوب Stitch: صورة مصغرة مدورة، اسم جريء، وملاحظة أن النقر
/// يفتح التعديل، مع زر «تعديل» مخفي-الحدود على الطرف الآخر.
class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryEntity category;

  void _openEdit(BuildContext context) {
    context.pushNamed(UpsertCategoryView.routeName, extra: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: .circular(16.r),
        border: Border.all(color: context.colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        type: .transparency,
        borderRadius: .circular(16.r),
        child: InkWell(
          onTap: () {
            return _openEdit(context);
          },
          borderRadius: .circular(16.r),
          child: Padding(
            padding: .symmetric(horizontal: 12.w, vertical: 12.h),
            child: Row(
              children: [
                SizedBox(
                  width: 56.w,
                  height: 56.w,
                  child: category.image.isEmpty
                      ? Container(
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary.withValues(
                              alpha: 0.08,
                            ),
                            borderRadius: .circular(12.r),
                          ),
                          child: Icon(
                            Icons.category_outlined,
                            color: context.colorScheme.primary,
                          ),
                        )
                      : CustomImage(
                          image: category.image,
                          borderRadius: .circular(12.r),
                        ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: 2.h,
                    children: [
                      Text(
                        category.name,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: context.textTheme.titleMedium,
                      ),
                      Text(
                        'اضغط للتعديل',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                CustomOutlinedButton(
                  text: 'تعديل',
                  icon: Icons.edit_outlined,
                  onTap: () {
                    return _openEdit(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  color: context.colorScheme.error,
                  tooltip: 'حذف التصنيف',
                  onPressed: () async {
                    if (!await confirmDelete(context, category.name)) {
                      return;
                    }
                    getIt<CategoriesBloc>().add(
                      CategoriesEvent.delete(category.id),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
