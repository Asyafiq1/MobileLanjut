import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitted Box"),
        ),
        body: Center(
          child: Container(
            color: Colors.blue,
            //width: 300,
            //height: 110,
            child: FittedBox(
              alignment: Alignment.centerRight,
              child: Image.network("https://picsum.photos/1200/500"),
            ),
          ),
        ),
      ),
    );
  }
  }