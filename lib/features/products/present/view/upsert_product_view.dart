import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/widgets/feedback/app_snackbar.dart';
import 'package:alzefr_dash/features/categories/present/blocs/bloc/categories_bloc.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_upsert_req_entity.dart';
import '../blocs/bloc/products_bloc.dart';
import '../blocs/product_upsert_bloc/product_upsert_bloc.dart';
import 'widgets/form/product_upsert_form.dart';

class UpsertProductView extends StatefulWidget {
  const UpsertProductView({super.key, required this.product});
  static const String routeName = "upsert";
  final ProductEntity? product;
  @override
  State<UpsertProductView> createState() => _UpsertProductViewState();
}

class _UpsertProductViewState extends State<UpsertProductView> {
  @override
  void initState() {
    super.initState();
    getIt<CategoriesBloc>().add(CategoriesEvent.get());
    final bloc = getIt<ProductUpsertBloc>();
    if (widget.product != null) {
      bloc.add(
        .dataChanged(
          productUpsertReq: ProductUpsertReqEntity(
            id: widget.product?.id,
            imageUrl: .dirty(value: widget.product?.image ?? ''),
            name: .dirty(value: widget.product?.name ?? ''),
            title: .dirty(value: widget.product?.title ?? ''),
            description: .dirty(value: widget.product?.description ?? ''),
            price: .dirty(value: widget.product?.price ?? ''),
            categoryId: .dirty(
              value: widget.product?.category.id.toString() ?? '',
            ),
            settlementMethods: widget.product?.settlementMethods ?? [],
          ),
        ),
      );
      // Fetch available methods manually if not loaded
      if (bloc.state.maybeMap(loaded: (s) => s.availableMethods.isEmpty, orElse: () => true)) {
        bloc.add(const ProductUpsertEvent.reset());
      }
    } else {
      bloc.add(const ProductUpsertEvent.reset());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductUpsertBloc, ProductUpsertState>(
      bloc: getIt<ProductUpsertBloc>(),
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            // The list is cached in a singleton bloc, so pull it again to show
            // the image that was just uploaded.
            getIt<ProductsBloc>().add(.get());
            context.showSuccessSnackBar(
              title: 'تم الحفظ',
              message: 'تم حفظ المنتج بنجاح',
            );
            context.pop();
          },
          failure: (errorInfo) {
            final message = errorInfo.message.trim().isEmpty
                ? 'تعذّر حفظ المنتج'
                : errorInfo.message.trim();
            context.showErrorSnackBar(title: 'خطأ', message: message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return ProductUpsertForm(
              req: state.productUpsertReq ?? const ProductUpsertReqEntity(),
              status: state.formzSubmissionStatus,
              isNew: widget.product == null,
              availableMethods: state.availableMethods,
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
