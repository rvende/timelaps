import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/http_service.dart';

class CardInfos extends StatelessWidget{

  bool active;
  int id;
  int nbPictureTotal;
  int nbPictureActual;
  String comment;
  String startDate;
  String endDate;
  String creation;

  CardInfos(this.active,this.nbPictureTotal,this.nbPictureActual,this.comment,this.startDate,this.endDate,this.creation,this.id);

  @override
  Widget build(BuildContext context){
     return Container(
       child: Card(
         child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new 
                Column(children: <Widget>[
                  Text("Date de création : ",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                  Text(creation, textAlign: TextAlign.center,),
                  ],
                  
                

              ),

              new Card(key: null,
                child: Text("Nombre de photos : "+ nbPictureActual.toString()+"/" +nbPictureTotal.toString()),
              ),

              new Card(key: null,
                child: Text("Date/heure de début : "+startDate),
              ),

              new Card(key: null,
                child: Text("Date/heure de fin : "+endDate),
              ),
              new Card(key: null,
                child: Text("Commentaire : "+comment),
              ),
              
                
            RaisedButton(child: Text("Supprimer"), onPressed:(){deleteTimelapse(id);} , color: Colors.red,),
              
            ]

          ),
          
         ),
     );
  }
}