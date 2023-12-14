// StudentsPage.dart

// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:si_magang/models/mhs.dart';
import 'package:si_magang/services/mhs-services.dart';

void main() {
  runApp(StudentsPage());
}

class StudentsPage extends StatefulWidget {
  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  late Future<List<Mhs>> futureStudents;

  _StudentsPageState({required this.futureStudents});

  _StudentsPageState.mapFromJson(dynamic json) {
    this.futureStudents = json["futureStudent"];
  }

  @override
  void initState() {
    super.initState();
    futureStudents = MhsService().fetchStudents(); // Fetch students when the page is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: FutureBuilder<List<Mhs>>(
        future: futureStudents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].nama),
                  onTap: () {
                    // Show recommendations when a student is tapped
                    // You'll need to implement this part based on your requirements
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
