import 'package:intl/intl.dart';
import 'package:world_time/Application/utilites/extension/string_extension.dart';

class WorldTime {
  String abbreviation;
  String clientIp;
  String datetime;
  int dayOfWeek;
  int dayOfYear;
  bool dst;
  Null dstFrom;
  int dstOffset;
  Null dstUntil;
  int rawOffset;
  String timezone;
  int unixtime;
  String utcDatetime;
  String utcOffset;
  int weekNumber;

  WorldTime(
      {this.abbreviation,
      this.clientIp,
      this.datetime,
      this.dayOfWeek,
      this.dayOfYear,
      this.dst,
      this.dstFrom,
      this.dstOffset,
      this.dstUntil,
      this.rawOffset,
      this.timezone,
      this.unixtime,
      this.utcDatetime,
      this.utcOffset,
      this.weekNumber});

  WorldTime.fromJson(Map<String, dynamic> json) {
    abbreviation = json['abbreviation'];
    clientIp = json['client_ip'];
    datetime = json['datetime'];
    dayOfWeek = json['day_of_week'];
    dayOfYear = json['day_of_year'];
    dst = json['dst'];
    dstFrom = json['dst_from'];
    dstOffset = json['dst_offset'];
    dstUntil = json['dst_until'];
    rawOffset = json['raw_offset'];
    timezone = json['timezone'];
    unixtime = json['unixtime'];
    utcDatetime = json['utc_datetime'];
    utcOffset = json['utc_offset'];
    weekNumber = json['week_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abbreviation'] = this.abbreviation;
    data['client_ip'] = this.clientIp;
    data['datetime'] = this.datetime;
    data['day_of_week'] = this.dayOfWeek;
    data['day_of_year'] = this.dayOfYear;
    data['dst'] = this.dst;
    data['dst_from'] = this.dstFrom;
    data['dst_offset'] = this.dstOffset;
    data['dst_until'] = this.dstUntil;
    data['raw_offset'] = this.rawOffset;
    data['timezone'] = this.timezone;
    data['unixtime'] = this.unixtime;
    data['utc_datetime'] = this.utcDatetime;
    data['utc_offset'] = this.utcOffset;
    data['week_number'] = this.weekNumber;
    return data;
  }
}

extension WorldTimeExtension on WorldTime {
  String get formattedDateString {
    DateTime time = datetime.addTime(offset: utcOffset);
    return DateFormat.jm().format(time);
  }

  DateTime get formattedTime {
    return datetime.addTime(offset: utcOffset);
  }

  bool get isDayTime {
    return formattedTime.hour > 6 && formattedTime.hour < 20;
  }
}
