import 'package:alzefr_dash/core/widgets/feedback/empty_widget.dart';
import 'package:alzefr_dash/core/widgets/feedback/error_content_widget.dart';
import 'package:alzefr_dash/features/products/present/view/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../blocs/bloc/products_bloc.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});
  static const String routeName = "products";
  @override
  State<ProductsView> createState() {
    return _ProductsViewState();
  }
}

class _ProductsViewState extends State<ProductsView> {
  ProductsBloc get _bloc => getIt<ProductsBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(.get());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: _bloc,
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            final products = state.products ?? [];
            if (products.isEmpty) {
              return const EmptyWidget(
                icon: Icons.shopping_basket_outlined,
                text: 'لا توجد منتجات',
              );
            }
            return ProductsWidget(products: products);
          },
          failure: (state) {
            final error = state.apiErrorModel;
            final message = [error.title, error.message]
                .map((part) => part.trim())
                .where((part) => part.isNotEmpty)
                .join(' - ');
            return CustomErrorWidget(
              message: message.isEmpty ? 'تعذّر تحميل المنتجات' : message,
              retryText: 'إعادة المحاولة',
              onRetry: () => _bloc.add(ProductsEvent.get()),
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
