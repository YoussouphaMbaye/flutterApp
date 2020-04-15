import 'package:flutter/material.dart';
import 'package:flutterapp/GaleryDetails.dart';

class Galery extends StatefulWidget {


  @override
  _GaleryState createState() => _GaleryState();
}

class _GaleryState extends State<Galery> {

  String city;
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather"),backgroundColor: Colors.deepOrange,),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(hintText: "ville"),
                controller:_controller ,
                onChanged: (value){
                  setState((){
                    this.city=value;
                  });
                },
              ),

            ),

          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: RaisedButton(
                color: Colors.deepOrange,
                child:Text("weather...",style: TextStyle(fontSize: 22,color: Colors.white),) ,
                onPressed: ()=>{
                  setState((){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GaleryDetails(this.city)));
                  })
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
