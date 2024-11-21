import 'package:intl/intl.dart';

class FormatDatetime {
  static String jsonFormatDateTime({required String jsonDateTime, required String format, bool? toLocal = true}) {
    var dateTime = DateTime.parse(jsonDateTime);
    if (toLocal == true) {
      dateTime = dateTime.toLocal();
    }
    return DateFormat(format).format(dateTime);
  }
}
