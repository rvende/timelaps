import 'package:flutter/material.dart';
import 'package:myapp/cardImages.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:myapp/http_service.dart';
import 'package:myapp/TimelapseData.dart';
import 'package:myapp/cardVideo.dart';
import 'package:myapp/DataFetch.dart';
import 'package:myapp/cardGraph.dart';
import 'package:myapp/cardInfos.dart';

class CardTimeLaps extends StatefulWidget{
  CardTimeLaps({Key key, this.title}) : super(key: key);
  static const String routeName = "/laps";
  final String title;
  
  @override
  CardTimeLapsState createState() => new CardTimeLapsState();
  
}

class CardTimeLapsState extends State<CardTimeLaps>{
  
  @override
  Widget build(BuildContext context) {
    
    final ScreenArguments arg = ModalRoute.of(context).settings.arguments;
    //TimelapseData data =  getTimelapse(arg);
    return Scaffold(
      
      /*body: <SingleChildScrollView>(
        child: Row(
         
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[*/
            body : Container(
              child: FutureBuilder<TimelapseData>(
                
                future: getTimelapse(arg.id),
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Dialog(
                          
                          shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                          child: Container(
                            height: 100,
                            child: Column(children: <Widget>[
                              
                              TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    
                                    hintText: 'Impossible d\'afficher le timelapse !'),
                                    style: 
                                    TextStyle(
                                      color: Colors.black,
                                      //fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                              ),
                            ],),
                          ),
                          
                        );
                  } //print(snapshot.error);
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return TimelapseCardDyn(tmlps: snapshot.data,image : arg.image);
                  /*return snapshot.hasData
                  ? TimelapsCardDyn(tmlps: snapshot.data)
                  : Center(child: CircularProgressIndicator());*/
                },
              ),
                //padding: EdgeInsets.all(15.0),
                ),
        
      
      
            /*TimelapsCard(true,"Timelapse #1",'images/chantier.jpg'),
            TimelapsCard(false,"Timelapse #2",'images/fleur.jpg'),
            TimelapsCard(true,"Timelapse #3",'images/lune.png'),*/
            
        //],
      //),
      );
    
  }

}

class ScreenArguments {
  final int id;
  final String image;

  ScreenArguments(this.id, this.image);
}



class TimelapseCardDyn extends StatelessWidget{
  final TimelapseData tmlps;
  final String image;
  TimelapseCardDyn({Key key, this.tmlps,this.image}) : super(key: key);
  static const double innerPadding = 20.0;
  static const double opacity = 0.75;
  static const double size = 250.0;
  static List<DataFetch> temperatures;
  static List<DataFetch> humidites;
  /*final bool isLeft;
  final String title;
  final String image;*/
  final Color color = Colors.orange;
  
  
  


  @override
  Widget build(BuildContext context){
    //print("Measures : ");
    //print(tmlps.startDate);
    temperatures = new List<DataFetch>();
    humidites = new List<DataFetch>();
    for(int i = 0; i <tmlps.measures.length;i++){
        temperatures.add(new DataFetch((i+1).toString(), tmlps.measures[i].temp ));
        humidites.add(new DataFetch((i+1).toString(), tmlps.measures[i].humi ));
    }
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(tmlps.identifier),
            bottom: TabBar(
              isScrollable: false,
              tabs: <Widget>[
                new Tab(icon: new Icon(Icons.videocam)),
                new Tab(icon: new Icon(Icons.photo_size_select_actual)),
                new Tab(icon: new Icon(Icons.show_chart)),
                new Tab(icon: new Icon(Icons.info)),
              ],
            ),
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context),
            ),
            backgroundColor: Colors.orange,
          ),
          body: TabBarView(
            children: [
              new CardVideo(image),
              new CardImages(tmlps.links),
              new CardGraph(tmlps.measures),
              new CardInfos(tmlps.active,tmlps.picturesCountTotal,tmlps.picturesCountActual,tmlps.comment,tmlps.startDate.toString(),tmlps.endDate.toString(),tmlps.creation.toString(),tmlps.id),
            ]
            ),
        ),
      ),
    

    );
      
      
  }
}
