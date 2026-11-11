import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/widgets/feedback/app_snackbar.dart';
import '../../domain/entities/categories_res_entity.dart';
import '../../domain/entities/category_upsert_req_entity.dart';
import '../blocs/bloc/categories_bloc.dart';
import '../blocs/category_upsert_bloc/category_upsert_bloc.dart';
import 'widgets/category_upsert_form.dart';

class UpsertCategoryView extends StatefulWidget {
  const UpsertCategoryView({super.key, required this.category});
  static const String routeName = "category_upsert";
  final CategoryEntity? category;
  @override
  State<UpsertCategoryView> createState() => _UpsertCategoryViewState();
}

class _UpsertCategoryViewState extends State<UpsertCategoryView> {
  @override
  void initState() {
    super.initState();
    final bloc = getIt<CategoryUpsertBloc>();
    if (widget.category != null) {
      bloc.add(
        CategoryUpsertEvent.dataChanged(
          categoryUpsertReq: CategoryUpsertReqEntity(
            id: widget.category?.id,
            imageUrl: .dirty(value: widget.category?.image ?? ''),
            name: .dirty(value: widget.category?.name ?? ''),
          ),
        ),
      );
    } else {
      bloc.add(const CategoryUpsertEvent.reset());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryUpsertBloc, CategoryUpsertState>(
      bloc: getIt<CategoryUpsertBloc>(),
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            getIt<CategoriesBloc>().add(CategoriesEvent.get());
            context.showSuccessSnackBar(
              title: 'تم الحفظ',
              message: 'تم حفظ التصنيف بنجاح',
            );
            context.pop();
          },
          failure: (error) {
            context.showErrorSnackBar(
              title: 'خطأ',
              message: 'تعذّر حفظ التصنيف، حاول مرة أخرى',
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return CategoryUpsertForm(
              req: state.categoryUpsertReq ?? const CategoryUpsertReqEntity(),
              status: state.formzSubmissionStatus,
              isNew: widget.category == null,
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