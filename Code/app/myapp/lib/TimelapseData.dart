import 'dart:convert';
import 'package:myapp/measure.dart';

class TimelapseData extends Object {

  bool active;

  int id;
  int picturesCount;

  String identifier;
  String comment;

  DateTime startDate;
  DateTime endDate;
  DateTime creation;

  List<String> links;
  List<Measure> measures;


  TimelapseData({
    this.active,

    this.id,
    this.picturesCount,

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
      picturesCount: json["pictures_count"] as int,
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