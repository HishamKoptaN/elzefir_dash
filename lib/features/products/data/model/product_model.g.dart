// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      settlementMethods: (json['settlement_methods'] as List<dynamic>?)
          ?.map(
            (e) => SettlementMethodModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      priceVariants: (json['price_variants'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'settlement_methods': instance.settlementMethods,
      'price_variants': instance.priceVariants,
    };

_AdditionModel _$AdditionModelFromJson(Map<String, dynamic> json) =>
    _AdditionModel(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$AdditionModelToJson(_AdditionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
    };
