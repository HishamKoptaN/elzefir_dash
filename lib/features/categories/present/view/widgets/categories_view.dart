import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/widgets/feedback/app_snackbar.dart';
import '../../../../home/present/widgets/editing_btn.dart';
import '../../blocs/bloc/categories_bloc.dart';
import '../upsert_category_view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  static const String routeName = 'categories';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      bloc: getIt<CategoriesBloc>(),
      listener: (context, state) async {
        await state.whenOrNull(
          success: () {
            context.showSuccessSnackBar(
              title: 'نجاح',
              message: 'تم تحديث الدور',
            );
          },
          failure: (error) {
            context.showSuccessSnackBar(
              title: 'نجاح',
              message: "فشل في تحديث الدور",
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (sallaOptionCategories, loading) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: sallaOptionCategories?.length,
              itemBuilder: (context, index) {
                final category = sallaOptionCategories?[index];
                return SizedBox(
                  width: 100.w,
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: .circular(12.r),
                    ),
                    child: ListTile(
                      contentPadding: const .symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple.shade50,
                        foregroundColor: Colors.deepPurple,
                        child: Text(
                          category?.id.toString() ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        category?.name ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: .w600,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: CustomOutlinedButton(
                        text: 'تعديل',
                        onTap: () {},
                      ),
                      onTap: () {
                        context.pushNamed(
                          UpsertCategoryView.routeName,
                          extra: category,
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
          initial: () {
            return const Center(child: CircularProgressIndicator());
          },
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
