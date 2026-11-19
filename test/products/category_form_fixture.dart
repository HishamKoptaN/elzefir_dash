import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/networking/api_result.dart';
import 'package:alzefr_dash/features/categories/domain/entities/categories_res_entity.dart';
import 'package:alzefr_dash/features/categories/present/blocs/bloc/categories_bloc.dart';
import 'package:alzefr_dash/features/products/data/mapper/products_mapper.dart';
import 'package:alzefr_dash/features/products/data/model/product_model.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/products/present/blocs/product_upsert_bloc/product_upsert_bloc.dart';
import 'package:alzefr_dash/features/products/present/view/upsert_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../support/fake_use_cases.dart';

class CategoryFormFixture {
  final categories = FakeCategoriesUseCases();
  late final categoriesBloc = CategoriesBloc(categoriesUseCases: categories);
  final productBloc = ProductUpsertBloc(
    productsUseCases: FakeProductsUseCases(),
  );

  void register() {
    getIt.registerSingleton<CategoriesBloc>(categoriesBloc);
    getIt.registerSingleton<ProductUpsertBloc>(productBloc);
  }

  void loadCategories() {
    categories.result.complete(
      const ApiResult.success(
        data: [
          CategoryEntity(id: 7, name: 'مشويات'),
          CategoryEntity(id: 8, name: 'مقبلات'),
        ],
      ),
    );
  }

  Future<void> dispose() async {
    await categoriesBloc.close();
    await productBloc.close();
    await getIt.reset();
  }

  ProductEntity product({int id = 1, int categoryId = 7}) {
    return ProductModel.fromJson(
      normalizeProductJson({
        'id': id,
        'name': 'بوري مشوي',
        'title': 'بوري مشوي على الفحم',
        'description': 'سمك على الفحم',
        'price': 130,
        'category_id': categoryId,
      }),
    ).toEntity();
  }

  Widget app({ProductEntity? product}) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      builder: (context, child) {
        return MaterialApp(
          home: Scaffold(
            body: UpsertProductView(
              key: ValueKey(product?.id),
              product: product,
            ),
          ),
        );
      },
    );
  }
}
