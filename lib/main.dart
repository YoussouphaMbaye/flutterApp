import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp/CameraPage.dart';
import 'package:flutterapp/Galery.dart';
import 'package:flutterapp/weather.dart';
import './Quiz.dart';

void main() => runApp(MaterialApp(home:MyApp()));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

          drawer: Drawer(
            child:ListView(
                  children: <Widget>[
                        DrawerHeader(
                          decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Colors.deepOrange,Colors.white]),
                              ),

                            child:Center(

                              child:CircleAvatar(
                                  backgroundImage: AssetImage("images/logo.jpg"),
                              )
                          )
                      ),

                    ListTile(
                      title: Text("Quiz",style: TextStyle(fontSize: 22)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Galery",style: TextStyle(fontSize: 22)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Galery()));
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Camera",style: TextStyle(fontSize: 22)),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>CameraPage()));
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text("weather",style: TextStyle(fontSize: 22)),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Weather()));
                      },
                    ),


                  ],
            ),
          ),

          appBar:AppBar(
            title:Text('my appBar'),
          ) ,

          body:  Center(
            child: Text('Hello you le grand',style: TextStyle(fontSize: 22,color: Colors.blue),),
          ),

    );

  }

}