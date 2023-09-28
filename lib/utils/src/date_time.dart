import 'package:catering_core/core.dart';

extension DateTimeStringExtension on String? {
  String getHourMinute() {
    try {
      var date = DateTime.parse(this!);
      final format = DateFormat("HH:mm");
      return format.format(date);
    } catch (e) {
      return "-";
    }
  }

  String getDateMonthYear() {
    if (this == null) return "";
    var date = DateTime.parse(this!);
    final format = DateFormat("dd-MM-yyyy");
    return format.format(date);
  }

  String getDateMonthYearHourMinute() {
    if (this == null) return "";
    var date = DateTime.parse(this!);
    final format = DateFormat("dd-MM-yyyy HH:mm");
    return format.format(date);
  }

  String getDateMonthNameShortYearBulletHourMinute() {
    if (this == null) return "";
    var date = DateTime.parse(this!);
    final format = DateFormat("dd MMM yyyy • HH:mm");
    return format.format(date);
  }
}

extension DateTimeExtension on DateTime? {
  String getDateMonthYear() {
    if (this == null) return "";
    final format = DateFormat("dd-MM-yyyy");
    return format.format(this!);
  }

  String getMonthNameYear() {
    if (this == null) return "";
    final format = DateFormat("MMMM yyyy");
    return format.format(this!);
  }

  int getDifrentBetweenTwoDate(DateTime comparer) {
    final dif = comparer.difference(this!).inSeconds ~/ (31536000);
    return dif;
  }
}
