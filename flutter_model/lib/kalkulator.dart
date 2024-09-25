import 'package:flutter/material.dart';

void main() {
  runApp(KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KalkulatorHomePage(),
    );
  }
}

class KalkulatorHomePage extends StatefulWidget {
  @override
  _KalkulatorHomePageState createState() => _KalkulatorHomePageState();
}

class _KalkulatorHomePageState extends State<KalkulatorHomePage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String _hasil = "";

  void _hitung(String operasi) {
    double angka1 = double.tryParse(_angka1Controller.text) ?? 0;
    double angka2 = double.tryParse(_angka2Controller.text) ?? 0;
    double hasil = 0;

    switch (operasi) {
      case '+':
        hasil = angka1 + angka2;
        break;
      case '-':
        hasil = angka1 - angka2;
        break;
      case '*':
        hasil = angka1 * angka2;
        break;
      case '/':
        if (angka2 != 0) {
          hasil = angka1 / angka2;
        } else {
          _hasil = "Tidak dapat dibagi dengan nol";
          setState(() {});
          return;
        }
        break;
    }

    _hasil = hasil.toString();
    setState(() {});
  }

  Widget _buildButton(String operasi) {
    return SizedBox(
      width: 40, // Lebar tombol
      height: 40, // Tinggi tombol
      child: ElevatedButton(
        onPressed: () => _hitung(operasi),
        child: Text(
          operasi,
          style: TextStyle(fontSize: 16.0),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
      ),
      body: Center(
        child: Container(
          width: 200, // Lebar yang lebih kecil
          padding: EdgeInsets.all(8.0), // Memberikan sedikit padding
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 4.0), // Border luar tabel
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0), // Border kotak Angka 1
                ),
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0), // Mengurangi padding
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _angka1Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Angka 1',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.0), // Mengurangi jarak antar elemen
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0), // Border kotak Angka 2
                ),
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0), // Mengurangi padding
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _angka2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Angka 2',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.0), // Mengurangi jarak antar elemen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton('+'),
                  SizedBox(width: 2), // Jarak antara tombol
                  _buildButton('-'),
                  SizedBox(width: 2), // Jarak antara tombol
                  _buildButton('*'),
                  SizedBox(width: 2), // Jarak antara tombol
                  _buildButton('/'),
                ],
              ),
              SizedBox(height: 4.0), // Mengurangi jarak antar elemen
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0), // Border kotak Hasil
                ),
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0), // Mengurangi padding
                child: Text(
                  'Hasil: $_hasil',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
