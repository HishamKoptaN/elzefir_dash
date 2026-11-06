// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeResModel _$HomeResModelFromJson(Map<String, dynamic> json) =>
    _HomeResModel(
      offerImage: json['offer_image'] as String?,
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      additions:
          (json['additions'] as List<dynamic>?)
              ?.map((e) => AdditionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeResModelToJson(_HomeResModel instance) =>
    <String, dynamic>{
      'offer_image': instance.offerImage,
      'categories': instance.categories,
      'products': instance.products,
      'additions': instance.additions,
    };
