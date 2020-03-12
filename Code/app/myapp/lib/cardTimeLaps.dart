import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:myapp/http_service.dart';
import 'package:myapp/TimelapseData.dart';

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
                                    
                                    hintText: 'Erreur de connexion !'),
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

class DataFetch{
        DataFetch(this.year, this.sales);
        final String year;
        final double sales;
}

class TimelapseCardDyn extends StatelessWidget{
  final TimelapseData tmlps;
  final String image;
  TimelapseCardDyn({Key key, this.tmlps,this.image}) : super(key: key);
  static const double innerPadding = 20.0;
  static const double opacity = 0.75;
  static const double size = 250.0;
  /*final bool isLeft;
  final String title;
  final String image;*/
  final Color color = Colors.orange;
  
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text(tmlps.identifier),
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  returnImage(image),
                  Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
      
        
                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                            SfCartesianChart(
                              legend: Legend(
                                isVisible: true,
                                position: LegendPosition.bottom,
                                ),
                              title: ChartTitle(
                                text: 'Température et hygrométrie du timelapse',
                              ),
                              primaryXAxis: CategoryAxis(),
                              series: <ChartSeries>[
                                  LineSeries<DataFetch, String>(
                                      dataSource: [
                                          DataFetch('Lundi', 35),
                                          DataFetch('Mardi', 28),
                                          DataFetch('Mercredi', 34),
                                          DataFetch('Jeudi', 32),
                                          DataFetch('Vendredi', 40)
                                      ],
                                      name: "Température",
                                      xValueMapper: (DataFetch sales, _) => sales.year,
                                      yValueMapper: (DataFetch sales, _) => sales.sales
                                  ),
                                  LineSeries<DataFetch, String>(
                                      dataSource: [
                                          DataFetch('Lundi', 22),
                                          DataFetch('Mardi', 21),
                                          DataFetch('Mercredi', 19),
                                          DataFetch('Jeudi', 17),
                                          DataFetch('Vendredi', 15)
                                      ],
                                      name: "Hygrométrie",
                                      xValueMapper: (DataFetch sales, _) => sales.year,
                                      yValueMapper: (DataFetch sales, _) => sales.sales
                                  )
                              ]
                            )
                          ])
                        ]),
              ],
              
            ),
            
            
            
          ),
        
      );
  }
}