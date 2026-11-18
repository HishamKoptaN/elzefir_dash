import 'package:alzefr_dash/core/widgets/feedback/error_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../categories/present/blocs/bloc/categories_bloc.dart';
import '../blocs/bloc/products_bloc.dart';
import 'upsert_product_view.dart';
import 'widgets/list/products_content.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});
  static const String routeName = "products";
  @override
  State<ProductsView> createState() {
    return _ProductsViewState();
  }
}

class _ProductsViewState extends State<ProductsView> {
  ProductsBloc get _bloc {
    return getIt<ProductsBloc>();
  }

  @override
  void initState() {
    super.initState();
    _bloc.add(.get());
    // Load categories here as well so search by category name works when the
    // route is opened directly (deep link, refresh) without passing by home.
    getIt<CategoriesBloc>().add(const CategoriesEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: _bloc,
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return BlocBuilder<CategoriesBloc, CategoriesState>(
              bloc: getIt<CategoriesBloc>(),
              builder: (context, categoriesState) {
                return ProductsContent(
                  products: state.products ?? [],
                  categories:
                      categoriesState.mapOrNull(
                        loaded: (state) {
                          return state.categories;
                        },
                      ) ??
                      [],
                  onAdd: () {
                    context.pushNamed(UpsertProductView.routeName);
                  },
                );
              },
            );
          },
          failure: (state) {
            final error = state.apiErrorModel;
            final message = [error.title, error.message]
                .map((part) {
                  return part.trim();
                })
                .where((part) {
                  return part.isNotEmpty;
                })
                .join(' - ');
            return CustomErrorWidget(
              message: message.isEmpty ? 'تعذّر تحميل المنتجات' : message,
              onRetry: () {
                _bloc.add(.get());
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
