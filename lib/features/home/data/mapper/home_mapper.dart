import '../../../categories/data/mapper/categories_mapper.dart';
import '../../../products/data/mapper/products_mapper.dart';
import '../../domain/entities/home_res_entity.dart';
import '../model/home_res_model.dart';

extension HomeREsModelMapper on HomeResModel {
  HomeResEntity toEntity() {
    return HomeResEntity(
      categories:
          categories?.map((e) {
            return e.toEntity();
          }).toList() ??
          [],
      products:
          products?.map((e) {
            return e.toEntity();
          }).toList() ??
          [],
      additions:
          additions?.map((e) {
            return e.toEntity();
          }).toList() ??
          [],
    );
  }
}
