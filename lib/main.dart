import 'package:flutter/material.dart';
import 'package:si_magang/models/hasil_rekomendasi.dart';
import 'package:si_magang/services/mhs-services.dart';

void main() async {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<HasilRekomendasi> hasilRekomendasi = [];

  void init() async {
    final res = await MhsService().fetchStudents();
    setState(() {
      hasilRekomendasi = res;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (hasilRekomendasi.isNotEmpty) {
      print(hasilRekomendasi[0].id);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('MyInterns'),
        backgroundColor: Color(0xFF12486C),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Text('Rekomendasi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            ),
          if (hasilRekomendasi.isNotEmpty)
            for (final rekomendasi in hasilRekomendasi)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], 
                    borderRadius: BorderRadius.circular(12)
                    ),
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('NIM: ${rekomendasi.id}'),
                                const SizedBox(height: 14),
                                Text('Nama: ${rekomendasi.nama}'),
                                const SizedBox(height: 14),
                                Text('Prodi: ${rekomendasi.prodi}'),
                                const SizedBox(height: 14),
                                Text('Alamat: ${rekomendasi.alamat}'),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 14),
                                  height: 2,
                                  width: double.maxFinite,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const Text('Tempat Rekomendasi Magang:'),
                                SizedBox(
                                  height: 240,
                                  width: double.maxFinite,
                                  child: ListView(
                                    children: [
                                      if (rekomendasi.tempatMagang != null)
                                        for (final tempatMagang
                                            in rekomendasi.tempatMagang!)
                                          ListTile(
                                            contentPadding: const EdgeInsets.all(0),
                                            title: Text(tempatMagang.namaTempat!),
                                            subtitle: Text(tempatMagang.alamat!),
                                          )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    leading: Text(rekomendasi.nama ?? ''),
                  ),
                ),
              )
        ],
      ),
    );
  }
}
