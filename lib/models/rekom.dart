class Rekomendasi{
  final String id_rekom;
  final String id_ak;
  final String kode_tempat;
  final String hasil_rekom;

  Rekomendasi(
      {required this.id_rekom,
      required this.id_ak,
      required this.kode_tempat,
      required this.hasil_rekom,
      });

  factory Rekomendasi.fromJson(Map<String, dynamic> parsedJson) {
    return Rekomendasi(
        id_rekom: parsedJson['id_rekom'],
        id_ak: parsedJson['id_ak'],
        kode_tempat: parsedJson['kode_tempat'],
        hasil_rekom: parsedJson['hasil_rekom'],
      );
  }
}