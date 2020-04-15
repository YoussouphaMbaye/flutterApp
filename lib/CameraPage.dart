import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galery'),
      ),
      body: Center(
        child: Text('Galery',style: TextStyle(fontSize: 22),),
      ),
    );
  }
}
