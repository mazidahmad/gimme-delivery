import 'package:intl/intl.dart';

class DateUtil {
  static String getSimpleDateTimeFormat(DateTime date) {
    DateFormat df = DateFormat('HH:mm MMM dd, yyyy');
    return df.format(date).toString();
  }
}
