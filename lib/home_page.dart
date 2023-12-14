// import 'package:flutter/material.dart';

// class Beranda extends StatefulWidget{
  
//   @override
//   BerandaState createState() {  
//     return BerandaState();  
//   }
// }

// class BerandaState extends State<Beranda>{

//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       '   Selamat datang di MyInterns. Anda akan diberikan rekomendasi tempat magang sesuai nilai akademik anda.',
//     ),
//     Text(
//       'Rekomendasi akan muncul disini.',
//     ),
//     Text(
//       'Profil akan muncul disini.',
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MyInterns'),
//         backgroundColor: Color(0xFF12486C),
//       ),
//       body: Center(
//         child: _widgetOptions[_selectedIndex],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: [
//             // Container(
//             //   decoration: BoxDecoration(color: Color(0xFF12486C), borderRadius: BorderRadius.circular(200)),
//             //   child: Row(
//             //     children: [
//             //       Container(
//             //         width: 20,
//             //         child: Image(image: AssetImage("logojti.png")),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color(0xFF12486C),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                     width: 50,
//                     child: Image(image: AssetImage("assets/logojti.png")),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 10),
//                     width: 100,
//                     child: Text("Name", style: TextStyle(color: Colors.white),),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               title: const Text('Beranda'),
//               selected: _selectedIndex == 0,
//               onTap: () {
//                 // Update the state of the app
//                 _onItemTapped(0);
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Rekomendasi'),
//               selected: _selectedIndex == 1,
//               onTap: () {
//                 // Update the state of the app
//                 _onItemTapped(1);
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Profil'),
//               selected: _selectedIndex == 2,
//               onTap: () {
//                 // Update the state of the app
//                 _onItemTapped(2);
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }