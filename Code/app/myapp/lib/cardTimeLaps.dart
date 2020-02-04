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
  //String title;
  
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
      
        //(${format.pattern})
                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                            SfCartesianChart(
                              title: ChartTitle(
                                text: 'Température et hygrométrie du timelapse',
                              ),
                              primaryXAxis: CategoryAxis(),
                              series: <ChartSeries>[
                                  // Initialize line series
                                  LineSeries<SalesData, String>(
                                      dataSource: [
                                          // Bind data source
                                          SalesData('Lundi', 35),
                                          SalesData('Mardi', 28),
                                          SalesData('Mercredi', 34),
                                          SalesData('Jeudi', 32),
                                          SalesData('Vendredi', 40)
                                      ],
                                      xValueMapper: (SalesData sales, _) => sales.year,
                                      yValueMapper: (SalesData sales, _) => sales.sales
                                  ),
                                  LineSeries<SalesData, String>(
                                      dataSource: [
                                          // Bind data source
                                          SalesData('Lundi', 22),
                                          SalesData('Mardi', 21),
                                          SalesData('Mercredi', 19),
                                          SalesData('Jeudi', 17),
                                          SalesData('Vendredi', 15)
                                      ],
                                      xValueMapper: (SalesData sales, _) => sales.year,
                                      yValueMapper: (SalesData sales, _) => sales.sales
                                  )
                              ]
                            )
                          ])
                        ]),
              ],
              
            ),
            
            //Text('Photos'),
            
            
          ),
        
      );
  }

}

class ScreenArguments {
  final String title;
  final String image;

  ScreenArguments(this.title, this.image);
}

class SalesData{
        SalesData(this.year, this.sales);
        final String year;
        final double sales;
    }