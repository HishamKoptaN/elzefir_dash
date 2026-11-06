import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../categories/data/model/categories_res_model.dart';
import '../../../products/data/model/product_model.dart';
part 'home_res_model.freezed.dart';
part 'home_res_model.g.dart';

@freezed
abstract class HomeResModel with _$HomeResModel {
  const factory HomeResModel({
    @JsonKey(name: 'offer_image') String? offerImage,
    @Default([]) List<CategoryModel>? categories,
    @Default([]) List<ProductModel>? products,
    @Default([]) List<AdditionModel>? additions,
  }) = _HomeResModel;
  factory HomeResModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResModelFromJson(json);
}
