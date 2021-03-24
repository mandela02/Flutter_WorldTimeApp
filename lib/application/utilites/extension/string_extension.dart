extension StringExtension on String {
  DateTime get time {
    return DateTime.parse(this);
  }

  String get ufcOffset {
    return this.substring(1, 3);
  }

  String get fromTimeZoneToTime {
    String string = this.split("/").last;
    return string.replaceAll("_", " ");
  }

  int get toInt {
    return int.parse(this);
  }

  DateTime addTime({String offset}) {
    DateTime now = this.time;
    now = now.add(Duration(hours: offset.ufcOffset.toInt));
    return now;
  }
}
