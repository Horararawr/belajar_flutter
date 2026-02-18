import 'package:flutter/material.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tugas 4 Flutter"),
          backgroundColor: Colors.indigo[50],
          elevation: 1,
        ),
        // 1. Root Widget
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // 2. Formulir Pengguna
            const Text(
              "Al Haq Kitchen - Order Form",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3F4E7A)),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "Nama",
                hintText: "Masukkan Nama Anda",
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
                hintText: "example@mail.com",
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: "No. HP",
                hintText: "Masukkan no. HP anda",
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: "Deskripsi",
                hintText: "Catatan tambahan pesanan",
              ),
            ),
            
            const SizedBox(height: 30),
            const Text(
              "Daftar Menu Favorit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3F4E7A)),
            ),
            const SizedBox(height: 10),

            // 3. Daftar Item
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF3F4E7A),
                child: Icon(Icons.bento_outlined, color: Colors.white),
              ),
              title: Text("Bento Box"),
              subtitle: Text("Rp 30.000"),
            ),
            const Divider(),

            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.rice_bowl_outlined, color: Colors.white),
              ),
              title: Text("Nasi Briyani"),
              subtitle: Text("Rp 20.000"),
            ),
            const Divider(),

            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.rice_bowl_sharp, color: Colors.white),
              ),
              title: Text("Nasi Liwet"),
              subtitle: Text("Rp 20.000"),
            ),
            const Divider(),

            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.bakery_dining, color: Colors.white),
              ),
              title: Text("Dimsum Mentai (isi 3)"),
              subtitle: Text("Rp 10.000"),
            ),
            const Divider(),

            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black87,
                child: Icon(Icons.set_meal, color: Colors.white),
              ),
              title: Text("Nasi Tuna Suwir Pedas"),
              subtitle: Text("Rp 20.000"),
            ),
            
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF3F4E7A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.code, color: Colors.white),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contoh Card", style: TextStyle(color: Colors.white)),
                      Text("Al Haq Kitchen Service", style: TextStyle(color: Colors.white70)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}