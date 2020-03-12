import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/config.dart';
import 'package:myapp/splash.dart';
import 'package:myapp/cardTimeLaps.dart';
import 'package:myapp/TimelapsesData.dart';
import 'package:myapp/http_service.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:async';

var routes = <String, WidgetBuilder>{
      Config.routeName: (BuildContext context) => new Config(title: "MyItemsPage"),
      MyHomePage.routeName : (BuildContext context) => new MyHomePage(title: "Home"),
      CardTimeLaps.routeName : (BuildContext context) => new CardTimeLaps(),
    };

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData(
        
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
      routes : routes,

    ));


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  static const String routeName = "/home";
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Future<Post> post;
  
  // @override
  // void initState() {
  //   super.initState();
  //   post = fetchPost();
  // }
  
  Future<bool> _onBackPressed(){
        return showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title: Text("Voulez vous vraiment quitter l'application?"),
            actions: <Widget>[
              FlatButton(child: Text("Non"),
              onPressed: ()=>Navigator.pop(context,false)),
               FlatButton(child: Text("Oui"),
              onPressed: () => SystemNavigator.pop()),
            ],
          )
        );
      }

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
      
      /*body: <SingleChildScrollView>(
        child: Row(
         
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[*/
            body : Padding(
              child: FutureBuilder<List<TimelapsesData>>(
                
                future: getAllTimelapses(),
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
                              RaisedButton(
                                onPressed: () {
                                  SystemNavigator.pop();
                                },
                                child: Text(
                                  "Ok",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.grey,
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
                  return TimelapsCardDyn(tmlps: snapshot.data);
                  /*return snapshot.hasData
                  ? TimelapsCardDyn(tmlps: snapshot.data)
                  : Center(child: CircularProgressIndicator());*/
                },
              ),
                padding: EdgeInsets.all(15.0),
                ),
                floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Config.routeName);
        },
        
        child: Icon(Icons.add),
      ),
      
            /*TimelapsCard(true,"Timelapse #1",'images/chantier.jpg'),
            TimelapsCard(false,"Timelapse #2",'images/fleur.jpg'),
            TimelapsCard(true,"Timelapse #3",'images/lune.png'),*/
            
        //],
      //),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Config.routeName);
        },
        
        child: Icon(Icons.add),
      ),*/ 

    );
    
    //);
  }
}
/*
class TimelapsCard extends StatelessWidget{
  TimelapsCard(this.isLeft,this.title,this.image);
  static const double innerPadding = 20.0;
  static const double opacity = 0.75;
  static const double size = 250.0;
  final bool isLeft;
  final String title;
  final String image;
  final Color color = Colors.orange;

  @override
  Widget build(BuildContext context){
    return new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned.fill(
          bottom: innerPadding,
          left: isLeft ? innerPadding : 0.0,
          right: !isLeft ? innerPadding : 0.0,
          top: innerPadding,
          child: Card(
            elevation: 15.0,
            child: Image(image: AssetImage(image), fit: BoxFit.cover,),
            ),
        ),
        Align(
          alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
          child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CardTimeLaps.routeName, arguments: ScreenArguments(
                    title,
                    image,
                  ),);
          
        },
          child: new Card(
            
            color: color.withOpacity(opacity),
            margin: EdgeInsets.all(10.0),
            elevation: 2.0,
            shape: const Border(),
            child: SizedBox(
              width: size,
              height: size,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Center(
                        child:
                        Text(title,style: 
                          TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                            ),),),
                    ),
                  ],
                ),
                ),
              ),
        )
        
          ),
          )
      ],
    );
  }
}
*/
class TimelapsCardDyn extends StatelessWidget{
  final List<TimelapsesData> tmlps;
  TimelapsCardDyn({Key key, this.tmlps}) : super(key: key);
  static const double innerPadding = 20.0;
  static const double opacity = 0.75;
  static const double size = 250.0;
  /*final bool isLeft;
  final String title;
  final String image;*/
  final Color color = Colors.orange;
  
  @override
  Widget build(BuildContext context){
      return ListView.builder(
        itemCount: tmlps.length,
        itemBuilder: (context, index) {
          return new Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Positioned.fill(
                bottom: innerPadding,
                left: (index%2 == 0) ? innerPadding : 0.0,
                right: !(index%2 == 0) ? innerPadding : 0.0,
                top: innerPadding,
                child: Card(
                  elevation: 15.0,
                  child: Image.network(tmlps[index].picture),
                  //returnImage(tmlps[index].picture),
                  //Image.network(tmlps[index].picture, fit: BoxFit.fitWidth),
                  //Image(image: AssetImage(tmlps[index].picture), fit: BoxFit.cover,),
                  ),
              ),
              Align(
                alignment: (index%2 == 0) ? Alignment.centerLeft : Alignment.centerRight,
                child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CardTimeLaps.routeName, arguments: ScreenArguments(tmlps[index].id,tmlps[index].picture));
                
              },
                child: new Card(
                  
                  color: color.withOpacity(opacity),
                  margin: EdgeInsets.all(10.0),
                  elevation: 2.0,
                  shape: const Border(),
                  child: SizedBox(
                    width: size,
                    height: size,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Center(
                              child:
                              Text(tmlps[index].identifier,style: 
                                TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                  ),),),
                          ),
                        ],
                      ),
                      ),
                    ),
              )
              
                ),
                )
            ],
          );
        }
      );
  
  }
}