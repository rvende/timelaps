
class Measure extends Object {
  int temp;
  int humi;

  Measure({this.temp,this.humi});

  factory Measure.fromJson(Map<String, dynamic> json) {
    return new Measure(
      temp: json['temp'] as int,
      humi: json['humi'] as int,
    );
  }


}