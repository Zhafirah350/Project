class Mhs{
  final String id;
  final String nama;
  final String prodi;
  final String alamat;

  Mhs(
      {required this.id,
      required this.nama,
      required this.prodi,
      required this.alamat,
      });

  factory Mhs.fromJson(Map<String, dynamic> Json) {
    return Mhs(
        id: Json['id'],
        nama: Json['nama'],
        prodi: Json['prodi'],
        alamat: Json['alamat'],
      );
  }
}