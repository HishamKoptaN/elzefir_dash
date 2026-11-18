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
import 'categories_kpi_strip.dart';
import 'categories_search_field.dart';
import 'category_card.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});
  static const String routeName = 'categories';

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  String _query = '';

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
            final query = _query.trim().toLowerCase();
            final filtered = query.isEmpty
                ? items
                : items
                      .where((item) {
                        return item.name.toLowerCase().contains(query);
                      })
                      .toList();
            return Column(
              children: [
                CategoriesHeader(
                  count: items.length,
                  onAdd: () {
                    return _openUpsert(context);
                  },
                ),
                if (items.isNotEmpty) CategoriesKpiStrip(categories: items),
                if (items.isNotEmpty)
                  CategoriesSearchField(
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
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
                      : filtered.isEmpty
                      ? const EmptyWidget(
                          icon: Icons.search_off_rounded,
                          text: 'لا توجد نتائج لبحثك',
                          hint: 'جرّب كلمة بحث أخرى أو امسح البحث لعرض كل التصنيفات',
                        )
                      : ListView.builder(
                          padding: .fromLTRB(0, 4.h, 0, 24.h),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(category: filtered[index]);
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
