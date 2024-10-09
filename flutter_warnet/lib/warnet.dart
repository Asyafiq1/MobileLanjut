import 'pelanggan.dart';

class Warnet {
  final Pelanggan pelanggan;
  DateTime tglMasuk;
  DateTime jamMasuk;
  DateTime jamKeluar;
  static const int tarifPerJam = 10000;

  Warnet({
    required this.pelanggan,
    required this.tglMasuk,
    required this.jamMasuk,
    required this.jamKeluar,
  });

  double hitungLama() {
    // Calculate the duration in hours
    return jamKeluar.difference(jamMasuk).inHours.toDouble();
  }

  double hitungDiskon(double lama) {
    double diskon = 0;
    if (pelanggan.jenisPelanggan == "VIP" && lama > 2) {
      diskon = 0.02 * tarifPerJam;
    } else if (pelanggan.jenisPelanggan == "GOLD" && lama > 2) {
      diskon = 0.05 * tarifPerJam;
    }
    return diskon;
  }

  double hitungTotalBayar() {
    double lama = hitungLama();
    double tarif = lama * tarifPerJam;
    double diskon = hitungDiskon(lama);
    return tarif - diskon;
  }
}
