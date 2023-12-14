// StudentService.dart

import 'package:http/http.dart' as http;
import 'package:si_magang/models/hasil_rekomendasi.dart';
import 'dart:convert';
import 'package:si_magang/models/mhs.dart';
import 'package:si_magang/models/tempat_magang.dart';

class MhsService {
  List<Mhs> items = [];

  Future<List<HasilRekomendasi>> fetchStudents() async {
    final response = await http.get(
      Uri.http('192.168.1.7:8000', 'api/rekom'),
    ); // Replace with your Laravel app URL
    var apiHasilRekomendasi = jsonDecode(response.body) as List<dynamic>;

    try {
      final List<HasilRekomendasi> arrHasilRekomendasi = [];
      for (var element in apiHasilRekomendasi) {
        final List<TempatMagang> arrTempatMagang = [];
        final response = await http.get(
          Uri.http('192.168.1.7:8000', 'rekomendasi/${element['id']}'),
        ); // Replace with your Laravel app URL
        var apiTempatMagang = jsonDecode(response.body) as List<dynamic>;

        for (final tempatMagang in apiTempatMagang) {
          arrTempatMagang.add(TempatMagang.fromJson(tempatMagang));
        }

        final hasilRekomendasi = HasilRekomendasi.fromJson(element);
        hasilRekomendasi.tempatMagang = arrTempatMagang;
        arrHasilRekomendasi.add(hasilRekomendasi);
      }
      return arrHasilRekomendasi;
    } catch (e) {
      return [];
    }
    return [];

    // if (items.isNotEmpty) {
    //   items.clear();
    //   print("it is empty");
    // }
    // return [];
    // for (var perData in jsonData) {
    //   final item = Mhs(
    //       id: perData['id'],
    //       nama: perData['nama'],
    //       prodi: perData['prodi'],
    //       alamat: perData['alamat']);
    //   items.add(item);
    // }

    // if (response.statusCode == 200) {
    //   List jsonResponse = json.decode(response.body);
    //     for (var perData in jsonData) {
    //     final item = Mhs(
    //         id: perData['id'],
    //         nama: perData['nama'],
    //         prodi: perData['prodi'],
    //         alamat: perData['alamat']);
    //     items.add(item);
    //   }
    //   return jsonResponse.map((item) => Mhs.fromJson(item)).toList();
    // } else {
    //   throw Exception('Failed to load students');
    // }
  }
}
