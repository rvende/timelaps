import 'dart:convert';

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


  TimelapseData({
    this.active,

    this.id,
    this.picturesCount,

    this.identifier,
    this.comment,

    this.startDate,
    this.endDate,
    this.creation,
    this.links    
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
    );
  }
}

TimelapseData parseTimelapsesData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  print(parsed);
  return parsed.map<TimelapseData>((json) => TimelapseData.fromJson(json));
}