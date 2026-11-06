class MetaEntity {
  final int? total;
  final int? totalPages;
  final int? currentPage;
  final int? perPage;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  MetaEntity({
    this.total,
    this.totalPages,
    this.currentPage,
    this.perPage,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  MetaEntity copyWith({
    int? total,
    int? totalPages,
    int? currentPage,
    int? perPage,
    bool? hasNextPage,
    bool? hasPreviousPage,
  }) => MetaEntity(
    total: total ?? this.total,
    totalPages: totalPages ?? this.totalPages,
    currentPage: currentPage ?? this.currentPage,
    perPage: perPage ?? this.perPage,
    hasNextPage: hasNextPage ?? this.hasNextPage,
    hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
  );
}
