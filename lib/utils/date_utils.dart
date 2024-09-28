import 'package:intl/intl.dart';

class DateFormatUtils {
  static const YYYY_MM_DD = "yyyy-MM-dd";
  static const EEE_dd_MMM_yyyy = "EEE,dd MMM yyyy";
  static const en_US = "en_US";
  static const dd = "dd";
  static const MMM = "MMM";

  static String formatDateRange(DateTime start, DateTime end) {
    String startDay = DateFormat(dd).format(start);
    String monthStartYear = DateFormat(MMM).format(start);
    String endDay = DateFormat(dd).format(end);
    String monthEndYear = DateFormat(MMM).format(end);

    return '$monthStartYear $startDay - $monthEndYear $endDay ';
  }

  static String formatDate(String date) {
    var dateTime = DateTime.parse(date);
    var formattedDate = DateFormat.yMMMMEEEEd(en_US).format(dateTime);
    var formattedTime = DateFormat.jm(en_US).format(dateTime);
    return '$formattedDate $formattedTime';
  }

  static String calculateAge(String dob) {
    var date = DateTime.parse(dob);
    var now = DateTime.now();
    var difference = now.difference(date);
    var age = difference.inDays / 365;
    return age.toStringAsFixed(0);
  }

  static String formatTime(String date) {
    var dateTime = DateTime.parse(date);
    var formattedTime = DateFormat.jm(en_US).format(dateTime);
    return formattedTime.toString();
  }
}
