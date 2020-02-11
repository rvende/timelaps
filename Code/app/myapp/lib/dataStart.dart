

class DataStart{
  final String dateDebut;
  final String dateFin;
  final String nom;
  final int nbPhoto;

  DataStart(this.dateDebut,this.dateFin,this.nom,this.nbPhoto);

  DataStart.fromJson(Map<String, dynamic> json)
    : dateDebut = json['dateDebut'],
    dateFin = json['dateFin'],
    nom = json['nom'],
    nbPhoto = json['nbPhoto'];


  Map<String, dynamic> toJson() =>
    {
      'dateDebut': dateDebut,
      'dateFin' : dateFin,
      'nom' : nom,
      'nbPhoto' : nbPhoto,
    };



}