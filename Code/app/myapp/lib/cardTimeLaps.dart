import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  Image(image: AssetImage(args.image)),
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

class ScreenArguments {
  final String title;
  final String image;

  ScreenArguments(this.title, this.image);
}

class DataFetch{
        DataFetch(this.year, this.sales);
        final String year;
        final double sales;
}