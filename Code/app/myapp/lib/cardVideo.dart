import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/http_service.dart';

class CardVideo extends StatelessWidget{
  final String urlImage;

  CardVideo(this.urlImage);

  @override
  Widget build(BuildContext context){
     return Card(
       child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  returnImage(urlImage),
                  ]
         )
     );
       
       
     
  }
}