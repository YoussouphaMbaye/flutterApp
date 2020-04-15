import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class WeathearDetail extends StatefulWidget {
  String city;
  WeathearDetail(this.city);
  @override
  _WeathearDetailState createState() => _WeathearDetailState();
}

class _WeathearDetailState extends State<WeathearDetail> {
  var myListe;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData(widget.city);
  }
  getData(String city){
    String url="https://pixabay.com/api/?key=11226210-36d9f9a30b6d21ba70b302ffd&q=${city}";

      http.get(url).then((rsp){
        setState(() {
          this.myListe = jsonDecode(rsp.body);
          print(this.myListe);
        });
      }).catchError((err){
        print(err);
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("weather of ${widget.city}"),backgroundColor: Colors.deepOrange),
      body:(this.myListe == null?Center(child:CircularProgressIndicator()):
        ListView.builder(
            itemCount:(this.myListe==null?0:this.myListe["hits"].length) ,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:<Widget>[

                      CircleAvatar(
                        backgroundImage: NetworkImage("${this.myListe["hits"][index]["previewURL"].toString()}"),
                      ),
                      Flexible(
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${this.myListe["hits"][index]["tags"].toString()}",style: TextStyle(fontSize:22)),
                        ),

                      )


                    ],
                  ),
                  color: Colors.deepOrange,
                    ),

                );
              }
              )
        )

    );
    //https://samples.openweathermap.org/data/2.5/weather?q=Dakar&appid=b6907d289e10d714a6e88b30761fae22
  }
}
