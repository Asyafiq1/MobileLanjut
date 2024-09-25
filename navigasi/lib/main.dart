import 'package:flutter/material.dart';
import 'package:navigasi/page_satu.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
Widget build(BuildContext context) {
  return MaterialApp(
  home: PageSatu(),
  );
}
}