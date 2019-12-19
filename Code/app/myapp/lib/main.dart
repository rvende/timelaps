import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/config.dart';
import 'package:myapp/splash.dart';
import 'package:myapp/cardTimeLaps.dart';
//import 'package:myapp/second.dart';
var routes = <String, WidgetBuilder>{
      Config.routeName: (BuildContext context) => new Config(title: "MyItemsPage"),
      MyHomePage.routeName : (BuildContext context) => new MyHomePage(title: "Home"),
      CardTimeLaps.routeName : (BuildContext context) => new CardTimeLaps(),
    };
void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
     
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
      //home: new MyHomePage(title: 'Timelaps-A3'),
      home: SplashScreen(),
      routes : routes,

    ));
/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
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
      //home: new MyHomePage(title: 'Timelaps-A3'),
      home: SplashScreen(),
      routes : routes,

    );
  }
}*/

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  static const String routeName = "/home";
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
    void _decrementCounter() {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _counter--;
      });
  }

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
      /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(15.0),),
            TimelapsCard(true,"Timelaps #1",'images/chantier.jpg'),
            TimelapsCard(false,"Timelaps #2",'images/fleur.jpg'),
            TimelapsCard(true,"Timelaps #3",'images/lune.png'),
            /*Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),*/
          /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: _incrementCounter,
              child: new Text("Ajouter"),
            ),
          ],
          ),*/
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: _decrementCounter,
                  child: new Text("Enlever"),
                ),
              ],
            ),*/

        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: () {
          Navigator.pushNamed(context, Config.routeName);
        },
        /*onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Testing()),
      );
    },*/
  /*Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
  );*/

        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    ),);
  }
}

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