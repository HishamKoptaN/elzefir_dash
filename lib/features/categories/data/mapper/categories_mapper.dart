import '../../domain/entities/categories_res_entity.dart';
import '../../domain/entities/category_upsert_req_entity.dart';
import '../model/categories_res_model.dart';
import '../model/category_upsert_model.dart';

extension SallaOptionCategoryModelMapper on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(id: id ?? 0, name: name ?? '');
  }
}

extension CategoryUpsertReqEntityToModel on CategoryUpsertReqEntity {
  CategoryUpsertReqModel toModel() {
    return CategoryUpsertReqModel(
      id: id,
      name: name?.value,
      image: imageUrl?.value,
    );
  }
}
