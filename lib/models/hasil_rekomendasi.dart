import 'package:si_magang/models/tempat_magang.dart';

class HasilRekomendasi {
  String? id;
  String? nama;
  String? prodi;
  String? alamat;
  List<TempatMagang>? tempatMagang;

  HasilRekomendasi({this.id, this.nama, this.prodi, this.alamat, this.tempatMagang});

  factory HasilRekomendasi.fromJson(Map<String, dynamic> json) {
    return HasilRekomendasi(
      id: json['id'],
      nama: json['nama'],
      prodi: json['prodi'],
      alamat: json['alamat'],
    );
  }
}
