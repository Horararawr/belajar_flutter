import 'package:flutter/material.dart';

class Tugas2Flutter extends StatelessWidget {
  const Tugas2Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Header Halaman
      appBar: AppBar(
        backgroundColor: const Color(0xff00357a),
        centerTitle: true,
        title: const Text(
          "Profil Aplikasi", 
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30), 

          // 2. Baris 1
          const Center(
            child: Text(
              "Al-Haq Connect",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xff00357a)),
            ),
          ),

          const SizedBox(height: 20),

          // 3. Baris 2
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: const Row(
                children: [
                  Icon(Icons.person, color: Color(0xff00357a)),
                  SizedBox(width: 10),
                  Text("@alhaq.kitchen", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 4. Baris 3
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Icon(Icons.phone, size: 18),
                SizedBox(width: 5),
                Text("0812345678"),
                Spacer(),
                Icon(Icons.location_on, color: Colors.red, size: 18),
                Text("Jakarta Utara"),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // 5. Baris 4
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    child: const Center(child: Text("7 Menu", style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(child: Text("4.8 Rating", style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            ),
          ),

          // 6. Baris 5
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Al-Haq Kitchen adalah bisnis kuliner yang menyediakan berbagai macam hidangan lezat dengan cita rasa autentik. Kami berkomitmen untuk memberikan pengalaman makan yang tak terlupakan bagi setiap pelanggan kami. Dengan hadirnya Al-Haq Connect, aplikasi ini hadir untuk mempermudah pelanggan dalam memesan makanan dan mengakses informasi bisnis secara langsung.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87, 
                fontSize: 20, 
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          // 7. Baris 6
          SizedBox(height:25),
          Container(
              padding: const EdgeInsets.all(10),
              height:150,
              width:150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 109, 132, 146),
                borderRadius: BorderRadius.circular(12),
                ),
              child: Column(
                children: [
                  Image.asset("assets/images/Al_Haq_Kitchen.png")
                ],
              ),
            ),
        ],
      ),
    );
  }
}