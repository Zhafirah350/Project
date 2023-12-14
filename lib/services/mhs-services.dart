// StudentService.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_magang/models/mhs.dart';

class MhsService {
  List<Mhs> items = [];
  
  Future<List<Mhs>> fetchStudents() async {
    final response = await http.get(Uri.http('192.168.1.8:8000', 'api/rekom')); // Replace with your Laravel app URL
    var jsonData = jsonDecode(response.body);

    if (items.isNotEmpty) {
      items.clear();
      print("it is empty");
    }

    for (var perData in jsonData) {
      final item = Mhs(
          id: perData['id'],
          nama: perData['nama'],
          prodi: perData['prodi'],
          alamat: perData['alamat']);
      items.add(item);
    }

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
        for (var perData in jsonData) {
        final item = Mhs(
            id: perData['id'],
            nama: perData['nama'],
            prodi: perData['prodi'],
            alamat: perData['alamat']);
        items.add(item);
      }
      return jsonResponse.map((item) => Mhs.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }
}
