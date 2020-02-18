import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myapp/main.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),()=> //print("Splash done"));
    Navigator.pushNamed(context, MyHomePage.routeName));
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.orange),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Icon(
                        Icons.camera,
                        color: Colors.orange,
                        size: 50.0,
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                          "TimeLaps",
                          style: 
                          TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                            ),
                        )
                  ],
                ),
              ),),
            
            Expanded(
              flex: 1,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(backgroundColor: Colors.black,),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text("Online timelaps",
                  style: TextStyle(color: Colors.white,fontSize:18.0,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
        ],)
      ],)
    );
  }
}