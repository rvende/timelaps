import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:myapp/http_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:myapp/DataFetch.dart';
import 'package:myapp/measure.dart';



class CardGraph extends StatelessWidget{
  static List<DataFetch> temperatures;
  static List<DataFetch> humidites;
  final List<Measure> measures;

  CardGraph(this.measures){
    
    temperatures = new List<DataFetch>();
    humidites = new List<DataFetch>();
    for(int i = 0; i <measures.length;i++){
        temperatures.add(new DataFetch((i+1).toString(), measures[i].temp ));
        humidites.add(new DataFetch((i+1).toString(), measures[i].humi ));
    }
  }

  @override
  Widget build(BuildContext context){
     return Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
        Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          measures.length != 0 ?
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
                                      dataSource: 
                                          temperatures,
                                      
                                      name: "Température",
                                      xValueMapper: (DataFetch sales, _) => sales.year,
                                      yValueMapper: (DataFetch sales, _) => sales.sales
                                  ),
                                  LineSeries<DataFetch, String>(
                                      dataSource: humidites,
                                      name: "Hygrométrie",
                                      xValueMapper: (DataFetch sales, _) => sales.year,
                                      yValueMapper: (DataFetch sales, _) => sales.sales
                                  )
                              ]
                            ) : Text("Aucun graphique à afficher"),
                          ]),
                        ]
              
              
            );
       
       
     
  }
}