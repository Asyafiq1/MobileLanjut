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
        body: ListView(
          padding: const EdgeInsets.all(11),
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
             title: Text("Mhd. Rizki Asyafiq"),
             subtitle: Text("I don't need convession of human"),
             leading: CircleAvatar(),
             trailing: Text("12:45 PM")
            ),
          ],
        ),
      ),
    );
  }
}
  
    
    