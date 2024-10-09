import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double totalBayar;

  const ResultPage({Key? key, required this.totalBayar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Payment Result'),
      ),
      body: Center(
        child: Card(
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Bayar: Rp $totalBayar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
