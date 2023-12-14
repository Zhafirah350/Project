class Posisi{
  final String id_posisi;
  final String nama_posisi;

  Posisi(
      {required this.id_posisi,
      required this.nama_posisi,
      });

  factory Posisi.fromJson(Map<String, dynamic> parsedJson) {
    return Posisi(
        id_posisi: parsedJson['id_posisi'],
        nama_posisi: parsedJson['nama_posisi'],
      );
  }
}