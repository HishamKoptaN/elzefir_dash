import 'package:alzefr_dash/core/networking/api_result.dart';
import 'package:alzefr_dash/core/services/presigned_image_uploader.dart';
import 'package:alzefr_dash/features/products/data/mapper/products_mapper.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_entity.dart';
import 'package:alzefr_dash/features/products/domain/entities/product_upsert_req_entity.dart';
import 'package:alzefr_dash/features/products/domain/repo/products_repo.dart';
import 'package:alzefr_dash/features/products/domain/use_cases/products_use_cases.dart';
import 'package:alzefr_dash/features/products/present/blocs/product_upsert_bloc/product_upsert_bloc.dart';
import 'package:alzefr_dash/features/profile/domain/entities/presigned_url_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

class _FakeProductsRepo implements ProductsRepo {
  ProductUpsertReqEntity? lastUpsert;

  @override
  Future<ApiResult<List<ProductEntity>>> get() async =>
      const ApiResult.success(data: []);

  @override
  Future<ApiResult<PresignedUrlEntity>> presignedImageUrl({
    required String extension,
    required String productId,
  }) async =>
      throw UnimplementedError('not needed in this test');

  @override
  Future<ApiResult<UploadedImage>> uploadImage({
    required PresignedUrlEntity link,
    required XFile image,
  }) async =>
      throw UnimplementedError('not needed in this test');

  @override
  Future<ApiResult<ProductEntity>> upsert({
    required ProductUpsertReqEntity req,
  }) async {
    lastUpsert = req;
    return ApiResult.success(
      data: ProductEntity(id: req.id ?? 1, price: req.price?.value ?? ''),
    );
  }
}

ProductUpsertReqEntity _editReq({
  String name = 'بوري مشوي',
  String title = 'بوري مشوي على الفحم',
  String description = 'سمك على الفحم مع توابل مميزة',
  String price = '130',
}) {
  return ProductUpsertReqEntity(
    id: 1,
    name: GenericFormInput.dirty(value: name),
    title: GenericFormInput.dirty(value: title),
    description: GenericFormInput.dirty(value: description),
    price: GenericFormInput.dirty(value: price),
    categoryId: const GenericFormInput.dirty(value: '1'),
  );
}

Future<void> _flush() => Future<void>.delayed(const Duration(milliseconds: 50));

void main() {
  late _FakeProductsRepo productsRepo;
  late ProductUpsertBloc bloc;

  setUp(() {
    productsRepo = _FakeProductsRepo();
    bloc = ProductUpsertBloc(
      productsUseCases: ProductsUseCase(productsRepo: productsRepo),
    );
  });

  tearDown(() => bloc.close());

  test('editing a product with a single price reaches the repo '
      '(بوري مشوي = 130)', () async {
    final emitted = <ProductUpsertState>[];
    final sub = bloc.stream.listen(emitted.add);

    bloc.add(const ProductUpsertEvent.reset());
    await _flush();

    bloc.add(ProductUpsertEvent.dataChanged(productUpsertReq: _editReq()));
    await _flush();
    expect(
      bloc.state.mapOrNull(loaded: (s) => s.formzSubmissionStatus),
      FormzSubmissionStatus.success,
    );

    bloc.add(const ProductUpsertEvent.upsert());
    await _flush();
    await sub.cancel();

    expect(productsRepo.lastUpsert?.id, 1);
    expect(productsRepo.lastUpsert?.name?.value, 'بوري مشوي');
    expect(productsRepo.lastUpsert?.price?.value, '130');
    expect(emitted.contains(const ProductUpsertState.success()), isTrue);
  });

  test('a missing or invalid price blocks saving', () async {
    bloc.add(const ProductUpsertEvent.reset());
    await _flush();

    bloc.add(ProductUpsertEvent.dataChanged(productUpsertReq: _editReq(price: '')));
    await _flush();
    expect(
      bloc.state.mapOrNull(loaded: (s) => s.formzSubmissionStatus),
      FormzSubmissionStatus.failure,
    );

    bloc.add(ProductUpsertEvent.dataChanged(productUpsertReq: _editReq(price: '0')));
    await _flush();
    expect(
      bloc.state.mapOrNull(loaded: (s) => s.formzSubmissionStatus),
      FormzSubmissionStatus.failure,
    );

    bloc.add(ProductUpsertEvent.dataChanged(productUpsertReq: _editReq(price: 'abc')));
    await _flush();
    expect(
      bloc.state.mapOrNull(loaded: (s) => s.formzSubmissionStatus),
      FormzSubmissionStatus.failure,
    );
  });

  test('save is impossible with an empty title or description', () async {
    bloc.add(const ProductUpsertEvent.reset());
    await _flush();

    bloc.add(
      ProductUpsertEvent.dataChanged(
        productUpsertReq: _editReq(title: '', description: ''),
      ),
    );
    await _flush();

    expect(
      bloc.state.mapOrNull(loaded: (s) => s.formzSubmissionStatus),
      FormzSubmissionStatus.failure,
    );
  });

  test('mapper produces the numeric price stored on the product', () {
    final model = _editReq(price: '150.50').toModel();
    expect(model.price, 150.5);
    expect(model.price, isNot('150.50'));
  });
}
