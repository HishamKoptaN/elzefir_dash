// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_upsert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductUpsertReqModel _$ProductUpsertReqModelFromJson(
  Map<String, dynamic> json,
) => _ProductUpsertReqModel(
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
  name: json['name'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  price: json['price'] as num?,
  priceUnit: json['priceUnit'] as String?,
  categoryId: json['category_id'] as String?,
);

Map<String, dynamic> _$ProductUpsertReqModelToJson(
  _ProductUpsertReqModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
  'name': instance.name,
  'title': instance.title,
  'description': instance.description,
  'price': instance.price,
  'priceUnit': instance.priceUnit,
  'category_id': instance.categoryId,
};
