import 'package:alzefr_dash/core/widgets/feedback/empty_widget.dart';
import 'package:alzefr_dash/core/widgets/feedback/error_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/widgets/feedback/app_snackbar.dart';
import '../../blocs/bloc/categories_bloc.dart';
import '../upsert_category_view.dart';
import 'categories_header.dart';
import 'category_card.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  static const String routeName = 'categories';

  void _openUpsert(BuildContext context) {
    context.pushNamed(UpsertCategoryView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      bloc: getIt<CategoriesBloc>(),
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.showSuccessSnackBar(
              title: 'تم الحفظ',
              message: 'تم حفظ التصنيف بنجاح',
            );
          },
          failure: (error) {
            context.showErrorSnackBar(
              title: 'خطأ',
              message: 'تعذّر حفظ التصنيف، حاول مرة أخرى',
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (categories, loading) {
            final items = categories ?? [];
            return Column(
              children: [
                CategoriesHeader(
                  count: items.length,
                  onAdd: () {
                    return _openUpsert(context);
                  },
                ),
                Expanded(
                  child: items.isEmpty
                      ? EmptyWidget(
                          icon: Icons.category_outlined,
                          text: 'لا توجد تصنيفات بعد',
                          hint: 'أنشئ تصنيفات مثل "وجبات رئيسية" و"مشروبات" لتنظيم المنيو',
                          actionText: 'إضافة تصنيف',
                          onAction: () {
                            return _openUpsert(context);
                          },
                        )
                      : ListView.builder(
                          padding: .only(bottom: 24.h),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(category: items[index]);
                          },
                        ),
                ),
              ],
            );
          },
          failure: (error) {
            return CustomErrorWidget(
              message: 'تعذّر تحميل التصنيفات',
              onRetry: () {
                return getIt<CategoriesBloc>().add(CategoriesEvent.get());
              },
            );
          },
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}