import '../../data/entities/formatted_date_time_entity.dart';
import 'date_time_extension.dart' show DateTimeFormatterX;

extension SallaDateTimeExtension on String? {
  FormattedDateTimeEntity? toSallaDateTimeEntity() {
    if (this == null || this!.isEmpty) return null;
    final dateTime = DateTime.parse(this!).toLocal();
    return FormattedDateTimeEntity(
      dateTime: dateTime,
      formattedDate: dateTime.toFormattedDateString(),
      formattedTime: dateTime.toFormattedTimeString(),
      relativeTime: dateTime.toRelativeTimeString(),
      fullDateTime: dateTime.toFullDateTimeString(),
    );
  }
}
