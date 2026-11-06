import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_entity.freezed.dart';
part 'package_entity.g.dart';

@freezed
abstract class PackageEntity with _$PackageEntity {
  const factory PackageEntity({
    required int? id,
    required String? type,
    required int? quantity,
  }) = _PackageEntity;

  factory PackageEntity.fromJson(Map<String, dynamic> json) =>
      _$PackageEntityFromJson(json);
}
