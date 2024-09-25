import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController myController = TextEditingController();

  String hasil = "HASIL INPUT";

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Text Field"),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: myController,
                  onChanged: (value){
                    setState(() {
                      hasil = value;
                    });
                    print(value);
                  },
                  onSubmitted: (value) => print(value),
                  onEditingComplete: () {
                    print("BERHASIL");
                  },
                ),
                Text(hasil)
            
              ],
              ),
           ),
          ),
        ),
      );
    }
}