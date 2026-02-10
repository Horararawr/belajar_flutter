import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6CA651),
        title: Text("PPKD Batch 5"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text("Nama : Alfin"),
        Text("Umur : 19 Tahun"),
        Text("Pekerjaan: Mahasiswa")
        ],
      ),
      backgroundColor: Color(0xff1C4D8D),
    );
  }
}