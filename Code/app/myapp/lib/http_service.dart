import 'package:myapp/dataStart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

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

Future<ReturnConfig> pushConfig(DataStart toto) async {
  final response = await
      http.get('http://192.168.1.69/app/config.php?dateDebut='+toto.dateDebut
                                      +'&dateFin='+toto.dateFin
                                      +'&nom='+toto.nom
                                      +'&nbPhoto='+toto.nbPhoto.toString());
      /*http.get('http://192.168.1.69/app/config.php?dateDebut='+toto.dateDebut
                                      +'&dateFin='+toto.dateFin
                                      +'&nom='+toto.nom);*/

  if (response.statusCode == 200) {
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
    
  }
}

class ReturnConfig{
  final bool retour;
  ReturnConfig({this.retour});
  factory ReturnConfig.fromJson(Map<String,dynamic> json){
    return ReturnConfig(
      retour: json['return'],
    );
  }
}