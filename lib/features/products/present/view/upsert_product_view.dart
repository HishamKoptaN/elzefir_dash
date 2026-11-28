import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/errors/models/error_info.dart';
import 'package:alzefr_dash/core/widgets/feedback/app_snackbar.dart';
import 'package:alzefr_dash/features/categories/present/blocs/bloc/categories_bloc.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_upsert_req_entity.dart';
import '../blocs/bloc/products_bloc.dart';
import '../blocs/product_upsert_bloc/product_upsert_bloc.dart';
import 'widgets/form/product_upsert_form.dart';

String _errorMessage(ErrorInfo errorInfo) {
  final message = errorInfo.message.trim();
  return message.isEmpty ? 'تعذّر حفظ المنتج' : message;
}

ProductUpsertReqEntity _initialReq(ProductEntity? product) {
  return ProductUpsertReqEntity(
    id: product?.id,
    imageUrl: .dirty(value: product?.image ?? ''),
    name: .dirty(value: product?.name ?? ''),
    title: .dirty(value: product?.title ?? ''),
    description: .dirty(value: product?.description ?? ''),
    price: .dirty(value: product?.price ?? ''),
    priceUnit: .dirty(value: product?.priceUnit ?? ''),
    isFeatured: product?.isFeatured ?? false,
    isMostRequested: product?.isMostRequested ?? false,
    categoryId: .dirty(value: product?.category.id.toString() ?? ''),
  );
}

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
    final initialReq = _initialReq(widget.product);
    if (widget.product != null) {
      bloc
        ..setOriginal(initialReq)
        ..add(ProductUpsertEvent.dataChanged(productUpsertReq: initialReq));
    } else {
      bloc
        ..setOriginal(null)
        ..add(const ProductUpsertEvent.reset());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductUpsertBloc, ProductUpsertState>(
      bloc: getIt<ProductUpsertBloc>(),
      listener: (context, state) {
        state.maybeMap(
          success: (_) {
            getIt<ProductsBloc>().add(.get());
            context.showSuccessSnackBar(
              title: 'تم الحفظ',
              message: 'تم حفظ المنتج بنجاح',
            );
            context.pop();
          },
          // A failed save keeps the form loaded with the admin's input, so the
          // reason is reported here while they stay on the form to retry.
          loaded: (loaded) {
            final errorInfo = loaded.errorInfo;
            if (errorInfo != null) {
              context.showErrorSnackBar(
                title: 'خطأ',
                message: _errorMessage(errorInfo),
              );
            }
          },
          failure: (failure) {
            context.showErrorSnackBar(
              title: 'خطأ',
              message: _errorMessage(failure.apiErrorModel),
            );
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
