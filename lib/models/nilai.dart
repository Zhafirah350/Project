class Nilai{
  final String id_ak;
  final String kode_matkul;
  final String nim;
  final String nilai_akhir;

  Nilai(
      {required this.id_ak,
      required this.kode_matkul,
      required this.nim,
      required this.nilai_akhir,
      });

  factory Nilai.fromJson(Map<String, dynamic> parsedJson) {
    return Nilai(
        id_ak: parsedJson['id_ak'],
        kode_matkul: parsedJson['kode_matkul'],
        nim: parsedJson['nim'],
        nilai_akhir: parsedJson['nilai_akhir'],
      );
  }
}