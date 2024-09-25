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
        title: Text("Fitur Textfield"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            autocorrect: false,
            autofocus: false,
            enableSuggestions: true,
            enableInteractiveSelection: false,
            // enabled: false,
            //obscureText: true,
            //obscuringCharacter: '=',
            keyboardType: TextInputType.phone,
            readOnly: false,
            style: TextStyle(
              color: Colors.red,
              fontSize: 20
            ),
            decoration: InputDecoration(icon: Icon(
              Icons.person,
              size: 35,
            ),
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.person_add,
            size: 35,
            ),
            hintText: "Silahkan Input Nama",
            labelText: "Full Name"
            ),
          ),
          ),
      ),
     )
     
     );
  }
}