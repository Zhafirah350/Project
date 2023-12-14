class Magang{
  final String id;
  final String nama_tempat;
  final String id_posisi;
  final String alamat;

  Magang(
      {required this.id,
      required this.nama_tempat,
      required this.id_posisi,
      required this.alamat,
      });

  factory Magang.fromJson(Map<String, dynamic> parsedJson) {
    return Magang(
        id: parsedJson['id'],
        nama_tempat: parsedJson['nama_tempat'],
        id_posisi: parsedJson['id_posisi'],
        alamat: parsedJson['alamat'],
      );
  }
}