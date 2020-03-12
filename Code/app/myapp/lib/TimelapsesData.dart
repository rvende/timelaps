import 'dart:convert';

/*
  Cette classe permet de contruire les informations relatives
  aux timelapses affiché sur la première page

 */

class TimelapsesData extends Object {

  /*
    Attributs
  */
  int id; // Correspond à l'id du Timelapse, permet d'envoyer ce numéro pour l'affichage des données le concernant
  String identifier; // Correspond au nom du Timelapse
  String picture; // Correspond à l'URL de l'image associée au Timelapse

  /*
    Constructeur
    paramètres : 
      - id de type int
      - identifier de type String
      - picture de type String
  */

  TimelapsesData({
    this.id,
    this.identifier,
    this.picture,
  });

  factory TimelapsesData.fromJson(Map<String, dynamic> json) {
    return new TimelapsesData(
      id: json['id'] as int,
      identifier: json['identifier'] as String,
      picture: json['picture'] as String,
    );
  }
}

List<TimelapsesData> parseTimelapsesData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<TimelapsesData>((json) => TimelapsesData.fromJson(json)).toList();
}