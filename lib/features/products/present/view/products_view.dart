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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: getIt<ProductsBloc>(),
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return ProductsWidget(products: state.products ?? []);
          },
          orElse: () {
            return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
