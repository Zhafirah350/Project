class TempatMagang {
  String? id;
  String? namaTempat;
  String? idPosisi;
  String? alamat;

  TempatMagang({this.id, this.namaTempat, this.idPosisi, this.alamat});

  factory TempatMagang.fromJson(Map<String, dynamic> json) {
    return TempatMagang(
      id: json['id'],
      namaTempat: json['nama_tempat'],
      idPosisi: json['id_posisi'],
      alamat: json['alamat'],
    );
  }
}
