// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_upsert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryUpsertReqModel _$CategoryUpsertReqModelFromJson(
  Map<String, dynamic> json,
) => _CategoryUpsertReqModel(
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$CategoryUpsertReqModelToJson(
  _CategoryUpsertReqModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
  'name': instance.name,
};
