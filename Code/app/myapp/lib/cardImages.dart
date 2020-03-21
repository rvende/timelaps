import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/http_service.dart';

class CardImages extends StatelessWidget{
  final List<String> links;
goToDetailsPage(BuildContext context, String album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => Dialog(
              child: returnImage(album),
            ),
      ),
    );
  }

  CardImages(this.links);

  @override
  Widget build(BuildContext context){
     return links.length != 0 ? Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                      //margin: EdgeInsets.all(10.0),
                    Row(  
                      children: [
                        
                        Container(
                          margin: EdgeInsets.all(10.0),
                          //color: Colors.blue,
                          
                          height: MediaQuery.of(context).size.height-200,
                          width: MediaQuery.of(context).size.width-20,
                          child: 
                          
                          GridView.count(
                                    scrollDirection: Axis.vertical,
                                    crossAxisCount: 4,
                                    
                                    children: links.map((String url) {
                                      return Container(
                                                        //padding: EdgeInsets.all(20.0),
                                                        
                                                          child: GridTile(
                                                            child : InkResponse(
                                                                child: Image.network(url, fit: BoxFit.cover),
                                                                onTap: (){
                                                                 goToDetailsPage(context,url);
                                                                },
                                                              )
                                                            
                                                            //onTap: 
                                                          ),
                                                        
                                                        //color: Colors.blue[400],
                                                        margin: EdgeInsets.all(0.7),
                                                      );
                                      
                                    }).toList()),
                                    
                                
                        ),]
                    ),

     
     ]
     ): Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                      //margin: EdgeInsets.all(10.0),
                    Center(  
                      child: 
                        Text("Aucune photo n'a été prise pour le moment"),

                      )]);
       
       
     
  }
}