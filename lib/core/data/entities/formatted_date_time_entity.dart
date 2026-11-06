import 'package:freezed_annotation/freezed_annotation.dart';
part 'formatted_date_time_entity.freezed.dart';

@freezed
abstract class FormattedDateTimeEntity with _$FormattedDateTimeEntity {
  const factory FormattedDateTimeEntity({
    String? formattedDate,
    String? formattedTime,
    String? relativeTime,
    String? fullDateTime,
    DateTime? dateTime,
  }) = _FormattedDateTimeEntity;
}
