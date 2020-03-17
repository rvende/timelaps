import 'package:myapp/dataStart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:myapp/TimelapsesData.dart';
import 'package:myapp/TimelapseData.dart';

Future<void> fetchPost(DataStart toto, bool valid) async {
  final response =
      await http.get('10.0.0.1/toto.php?dateDebut='+toto.dateDebut
                                      +'&dateFin='+toto.dateFin
                                      +'&nom='+toto.nom
                                      +'&nombrePhoto='+toto.nbPhoto.toString());

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    //return Post.fromJson(json.decode(response.body));
    valid = true;
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    //throw Exception('Failed to load post');
    valid = false;
    throw Exception('Failed to load post');
  }
}

/*
  Fonction permettant de retourner une image via le réseau WIFI
*/

Image returnImage(String url){
    WiFiForIoTPlugin.forceWifiUsage(true);
    return Image.network(url);
}


Future<List<TimelapsesData>> getAllTimelapses() async{
  WiFiForIoTPlugin.forceWifiUsage(true);
  //final JsonDecoder _decoder = new JsonDecoder();
  String url = "http://10.0.0.1/timelapses/";
  final response = await http.get(url).timeout(const Duration(seconds: 10));
  if (response.statusCode == 200) {
    //return _decoder.convert(res);
    //var list = parseTimelapsesData(response.body);
    //var list = TimelapsesData.fromJson(_decoder.convert(response.body));
    var data = jsonDecode(response.body);
    var rest = data["timelapses"] as List;
    //list = 
    //print("GET ALL TIMELAPSES");
    //print(rest);
    var list = rest.map<TimelapsesData>((json)=>TimelapsesData.fromJson(json)).toList();
    //for (String id in list)
    //list.length;
    /*for(int i=0;i<list.length;i++){
      print(list[i].identifier);
    }*/

    return list;
    

    //print(response.body);
  }
}

Future<TimelapseData> getTimelapse(int id) async{
    WiFiForIoTPlugin.forceWifiUsage(true);
  //final JsonDecoder _decoder = new JsonDecoder();
    String url = "http://10.0.0.1/timelapses/"+id.toString();

    final response = await http.get(url).timeout(const Duration(seconds: 10));
  if (response.statusCode == 200) {
    //return _decoder.convert(res);
    //var list = parseTimelapsesData(response.body);
    //var list = TimelapsesData.fromJson(_decoder.convert(response.body));
    var data = jsonDecode(response.body);
    //var rest = data["taken_pictures"]["links"] as List<String>;

    //print("REST");
    //print(rest);
    //list = 
    //print("GET ALL TIMELAPSES");
    //print(rest);
    var res = TimelapseData.fromJson(data);
    //var list = rest.map<TimelapseData>((json)=>TimelapseData.fromJson(json));
    //for (String id in list)
    //list.length;
    
    /*for(int i=0;i<res.measures.length;i++){
      print(res.measures[i].temp);
    }*/
    

    return res;
    

    //print(response.body);
  }


}


/*Future<ReturnConfig> pushConfig(DataStart toto) async {
  final response = await
      http.get('http://192.168.1.69/app/config.php?dateDebut='+toto.dateDebut
*/
Future<http.Response> pushConfig(DataStart toto) async {
  WiFiForIoTPlugin.forceWifiUsage(true);

  var url = 'http://10.0.0.1/timelapses';

  Map data = {
    "start_date":toto.dateDebut,
    "end_date":toto.dateFin,
    "identifier":toto.nom,
    "pictures_count":toto.nbPhoto.toString(),
    "comment":" je sais pas quoi mettre comme commentaire! "
};

  var body = json.encode(data);

  print(body);

  final res = await http.post(url,headers: {"Content-Type": "application/json"},body: body);

  if (res.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    //return Post.fromJson(json.decode(response.body));
    print("ok");
    //return true;
    return json.decode(res.body);

  } else {
    throw new Exception("Error while fetching data");
  }

  

  
 
/*return http.post("http://10.0.0.1/timelapses",body: ).then((http.Response response) {
    final int statusCode = response.statusCode;
    print('status code : '+statusCode.toString());
    if (statusCode < 200 || statusCode > 400 || json == null) {
      print("erreur dans fonc");
      //throw new Exception("Error while fetching data");
      return false;
    }
    print("ok dans fonc");
    return true;
  });*/
}
 /* final response = await
      http.post("10.0.0.1/timelapses",body: {"start_date":toto.dateDebut,
                                             "end_date":toto.dateFin,
                                             "identifier":toto.nom,
                                             "pictures_count":toto.nbPhoto.toString(),
                                             "comment":" je sais pas quoi mettre comme commentaire! "}).then(http.Response response){

                                             
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });*/

      /*http.get('http://192.168.1.69/app/config.php?dateDebut='+toto.dateDebut
                                      +'&dateFin='+toto.dateFin
                                      +'&nom='+toto.nom
                                      +'&nbPhoto='+toto.nbPhoto.toString());*/
      /*http.get('http://192.168.1.69/app/config.php?dateDebut='+toto.dateDebut
                                      +'&dateFin='+toto.dateFin
                                      +'&nom='+toto.nom);*/

  /*if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    //return Post.fromJson(json.decode(response.body));
    print("ok");
    //return true;
    
    return ReturnConfig.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    print("error");
    throw Exception('Failed to load post');
    //print("error");
    //return false;
    
  }*/
/*}

class ReturnConfig{
  final bool retour;
  ReturnConfig({this.retour});
  factory ReturnConfig.fromJson(Map<String,dynamic> json){
    return ReturnConfig(
      retour: json['return'],
    );
  }
}*/