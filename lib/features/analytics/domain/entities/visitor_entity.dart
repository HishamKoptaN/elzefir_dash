import 'package:freezed_annotation/freezed_annotation.dart';
part 'visitor_entity.freezed.dart';

@freezed
abstract class VisitorEntity with _$VisitorEntity {
  const factory VisitorEntity({
    required String id,
    @Default(0) int visits,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
  }) = _VisitorEntity;
}
