import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:myapp/main.dart';
//import 'package:flutter/rendering.dart';




/*class SecondRoute extends StatelessWidget {
  SecondRoute({Key key, this.title}) : super(key: key);
  static const String routeName = "/MyItemsPage";
  final String title;

  @override
  
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Date-Time Picker example',
      
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: Config(),
    );
  }
}
*/
class Config extends StatefulWidget{
  Config({Key key, this.title}) : super(key: key);
  static const String routeName = "/MyItemsPage";
  final String title;
  @override
  ConfigState createState() => new ConfigState();
  
}

class ConfigState extends State<Config>{
  DateTime _date = DateTime.now();
  
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if(picked != null && picked != _date){
      
      setState(() {
        _date = picked;
        print(_date.toString());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
  
  return Scaffold(
    appBar: AppBar(
      title: Text("Nouveau Timelaps"),
      leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context),
        )

    ),
    body: Column(children: <Widget>[
      Text('Configuration du nouveau Timelaps',style: TextStyle(fontWeight: FontWeight.bold)),
      Text(new DateFormat("dd-MM-yyyy / HH:mm:ss").format(_date)),
      RaisedButton(
        child: Text('Choisir un jour'),
        onPressed: (){selectDate(context);} ,)
    ],)
  );
  
  }
}