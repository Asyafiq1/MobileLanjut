import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProductForm(),
  ));
}

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for the form inputs
  final _kodeController = TextEditingController();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();
  final _jumlahController = TextEditingController();
  final _diskonController = TextEditingController();
  final _totalController = TextEditingController();

  double _totalDiskon = 0;
  double _totalBayar = 0;
  double _total = 0;

  void _prosesTransaksi() {
    if (_formKey.currentState!.validate()) {
      final double harga = double.parse(_hargaController.text);
      final int jumlah = int.parse(_jumlahController.text);
      final double diskon = double.parse(_diskonController.text);
      final double total = double.parse(_totalController.text);

      // Menghitung total diskon dan total bayar
      _totalDiskon = (harga * jumlah) * (diskon / 100);
      _totalBayar = (harga * jumlah) - _totalDiskon;
      _total = (harga*jumlah);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Transaksi Barang'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Kode Barang dan Nama Barang dalam satu baris
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _kodeController,
                      decoration: InputDecoration(labelText: 'Kode Barang'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kode Barang harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10), // Jarak antara Kode Barang dan Nama Barang
                  Expanded(
                    child: TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(labelText: 'Nama Barang'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Barang harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Input harga barang
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _hargaController,
                      decoration: InputDecoration(labelText: 'Harga Barang'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harga Barang harus diisi';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Harga harus berupa angka';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _jumlahController,
                      decoration: InputDecoration(labelText: 'Jumlah Barang'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Jumlah Barang harus diisi';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Jumlah harus berupa angka';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Input diskon
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _diskonController,
                      decoration: InputDecoration(labelText: 'Diskon (%)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Diskon harus diisi';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Diskon harus berupa angka';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  // Tombol Proses
                  ElevatedButton(
                    onPressed: _prosesTransaksi,
                    child: Text('Proses'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Menampilkan hasil perhitungan
              Text(
                'Total Diskon: Rp {_totalDiskon.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Total Bayar: Rp {_totalBayar.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _kodeController.dispose();
    _namaController.dispose();
    _hargaController.dispose();
    _jumlahController.dispose();
    _diskonController.dispose();
    super.dispose();
  }
}
