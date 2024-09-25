import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter State Less',
      home: Scaffold(
        body: Center(
          child: Text('Mhd. Rizki Asyafiq',
          style: TextStyle(
            backgroundColor: Colors.white,
            color: Colors.purple,
            fontSize: 30,
            fontStyle: FontStyle.italic
          ),),
           ),
      ),
    );
  }
}
    
    