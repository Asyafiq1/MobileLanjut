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
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 100,
              height: 70,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height:70,
              color: Colors.yellow,
            ),
             Container(
              width: 100,
              height:70,
              color: Colors.purple,
            )
          ],
        ),

      ),
    );
  }
}
  
    
    