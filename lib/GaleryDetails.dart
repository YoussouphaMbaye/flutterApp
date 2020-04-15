import 'dart:convert';

import "package:flutter/material.dart";
import"package:http/http.dart" as http;
class GaleryDetails extends StatefulWidget {
  String city;
  GaleryDetails(this.city);
  @override
  _GaleryDetailsState createState() => _GaleryDetailsState();
}

class _GaleryDetailsState extends State<GaleryDetails> {
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData(widget.city);
  }
  getData(String city){
    String url="https://pixabay.com/api/?key=11226210-36d9f9a30b6d21ba70b302ffd&q=${city}";;
    http.get(url).then((resp){
      setState(() {
        
        this.data=jsonDecode(resp.body);
        print(this.data);
      });
      
    }).catchError((err){
      print(err);
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Gallery'),backgroundColor: Colors.deepOrange),
      body: (data==null)?CircularProgressIndicator():ListView.builder(
          itemCount: (data['hits']==null)?0:data['hits'].length,
          itemBuilder: (context,index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Card(
                  child: Image.network("${data['hits'][index]['webformatURL']}"),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.deepOrange,
                  child: Text("${data['hits'][index]['tags']}"
                    ,style: TextStyle(fontSize: 22,color: Colors.white),
                  ),
                ),

              ],
            );
          }
      ),
    );
  }
}

