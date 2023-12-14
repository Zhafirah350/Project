class Matkul{
  final String kode_matkul;
  final String nama_matkul;

  Matkul(
      {required this.kode_matkul,
      required this.nama_matkul,
      });

  factory Matkul.fromJson(Map<String, dynamic> parsedJson) {
    return Matkul(
        kode_matkul: parsedJson['id_posisi'],
        nama_matkul: parsedJson['nama_posisi'],
      );
  }
}