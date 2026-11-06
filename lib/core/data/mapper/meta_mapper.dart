import '../entities/meta_entity.dart';
import '../models/meta.dart';

extension MetaMapper on MetaModel {
  MetaEntity toEntity() {
    return MetaEntity(
      total: total ?? 0,
      currentPage: currentPage ?? 1,
      totalPages: totalPages ?? 1,
      perPage: perPage ?? 10,
      hasNextPage: hasNextPage ?? false,
      hasPreviousPage: hasPreviousPage ?? false,
    );
  }
}
