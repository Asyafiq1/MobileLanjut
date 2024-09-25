import 'package:flutter/material.dart';
import 'package:flutter_route/gallery_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return GalleryPage();
            },
          ));
        },
        child: Icon(Icons.arrow_right_alt),
      ),
    );
  }
}