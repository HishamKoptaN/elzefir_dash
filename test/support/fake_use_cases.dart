import 'dart:async';

import 'package:alzefr_dash/core/networking/api_result.dart';
import 'package:alzefr_dash/features/categories/domain/entities/categories_res_entity.dart';
import 'package:alzefr_dash/features/categories/domain/use_cases/categories_use_cases.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/products/domain/use_cases/products_use_cases.dart';

/// Use cases that only answer `get()`, with a result the test completes itself
/// so it controls when the page's data arrives. Every other member is
/// unimplemented.
class FakeCategoriesUseCases implements CategoriesUseCases {
  final result = Completer<ApiResult<List<CategoryEntity>>>();
  int getCalls = 0;

  @override
  Future<ApiResult<List<CategoryEntity>>> get() {
    getCalls++;
    return result.future;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    throw UnimplementedError();
  }
}

class FakeProductsUseCases implements ProductsUseCase {
  final result = Completer<ApiResult<List<ProductEntity>>>();

  @override
  Future<ApiResult<List<ProductEntity>>> get() {
    return result.future;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    throw UnimplementedError();
  }
}
