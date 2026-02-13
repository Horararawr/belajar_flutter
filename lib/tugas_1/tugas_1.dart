import 'package:flutter/material.dart';

class Tugas1Flutter extends StatelessWidget {
  const Tugas1Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFbc9c22),
        title: const Text('Tugas 1 Flutter'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nama : Muhammad Alfin Haq',
            style: TextStyle(
            fontSize: 40, 
            color: Colors.lightBlue),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 35),
              Text("Jakarta", style: TextStyle(color: Colors.blueGrey, fontSize: 32)),
            ],
          ),
          Text(
            "Seorang pelajar yang sedang belajar Flutter.",         
             style: TextStyle(
            fontSize: 25,
            color: Colors.white)
          ),
          Image.asset("assets/images/hidupJokowi.jpg")
        ],
      ),
      backgroundColor: const Color(0xFF00357a),
    );
  }
}