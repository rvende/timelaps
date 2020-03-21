import 'dart:convert';
import 'package:myapp/measure.dart';

class TimelapseData extends Object {

  bool active;

  int id;
  int picturesCountTotal;
  int picturesCountActual;

  String identifier;
  String comment;

  String startDate;
  String endDate;
  String creation;

  List<String> links;
  List<Measure> measures;


  TimelapseData({
    this.active,

    this.id,
    this.picturesCountTotal,
    this.picturesCountActual,

    this.identifier,
    this.comment,

    this.startDate,
    this.endDate,
    this.creation,
    this.links,
    this.measures
  });

  factory TimelapseData.fromJson(Map<String, dynamic> json) {
    
    return new TimelapseData(
      active: json['active'] as bool,
      id: json['id'] as int,
      picturesCountTotal: json["pictures_count"] as int,
      picturesCountActual: json["taken_pictures"]["count"] as int,
      startDate: json["start_date"] as String,
      endDate: json["end_date"] as String,
      creation: json["created_at"],
      identifier: json['identifier'] as String,
      comment: json['comment'] as String,
      links: json['taken_pictures']["links"].map<String>((data) => 
               data.toString()).toList() as List<String>,
      measures: json['sensor_measures'].map<Measure>((data) => 
               Measure.fromJson(data)).toList() as List<Measure>,
    );
  }
}

TimelapseData parseTimelapsesData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  print(parsed);
  return parsed.map<TimelapseData>((json) => TimelapseData.fromJson(json));
}