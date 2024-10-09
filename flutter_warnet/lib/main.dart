import 'package:flutter/material.dart';
import 'pelanggan.dart';
import 'warnet.dart';
import 'result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warnet Payment Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WarnetPage(),
    );
  }
}

class WarnetPage extends StatefulWidget {
  @override
  _WarnetPageState createState() => _WarnetPageState();
}

class _WarnetPageState extends State<WarnetPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  String? _jenisPelanggan = 'VIP';
  DateTime? _waktuMasuk;
  DateTime? _waktuKeluar;

  void _hitungTotalBayar() {
    if (_waktuMasuk != null && _waktuKeluar != null) {
      final pelanggan = Pelanggan(
        kodePelanggan: _kodeController.text,
        namaPelanggan: _namaController.text,
        jenisPelanggan: _jenisPelanggan!,
      );

      final warnet = Warnet(
        pelanggan: pelanggan,
        tglMasuk: DateTime.now(),
        jamMasuk: _waktuMasuk!,
        jamKeluar: _waktuKeluar!,
      );

      final totalBayar = warnet.hitungTotalBayar();

      // Navigate to the result page and pass the total amount
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(totalBayar: totalBayar),
        ),
      );
    }
  }

  Future<void> _pickDateTime(BuildContext context, bool isMasuk) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        final selectedDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );

        setState(() {
          if (isMasuk) {
            _waktuMasuk = selectedDateTime;
          } else {
            _waktuKeluar = selectedDateTime;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warnet Payment Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Form Entry Section
                Text(
                  'Form Entri',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _kodeController,
                          decoration: InputDecoration(
                            labelText: 'Kode Pelanggan',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter customer code';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _namaController,
                          decoration: InputDecoration(
                            labelText: 'Nama Pelanggan',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter customer name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          value: _jenisPelanggan,
                          decoration: InputDecoration(
                            labelText: 'Jenis Pelanggan',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _jenisPelanggan = newValue;
                            });
                          },
                          items: <String>['VIP', 'GOLD']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () => _pickDateTime(context, true),
                              child: Text('Set Waktu Masuk'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => _pickDateTime(context, false),
                              child: Text('Set Waktu Keluar'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        if (_waktuMasuk != null)
                          Text(
                            'Waktu Masuk: ${_waktuMasuk!.toString()}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        if (_waktuKeluar != null)
                          Text(
                            'Waktu Keluar: ${_waktuKeluar!.toString()}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _hitungTotalBayar();
                    }
                  },
                  child: Text(
                    'Hitung Total Bayar',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
