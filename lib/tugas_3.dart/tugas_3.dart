import 'package:flutter/material.dart';

class Tugas3Flutter extends StatelessWidget {
  const Tugas3Flutter ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Al Haq Kitchen - Order System"),
          backgroundColor: Colors.orange[100],
          elevation: 1,
        ),
        // 1. Area scrolling utamanya pakai SingleChildScrollView
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Input New Catering Order",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                
                // 2. Form Input Datanya pakai TextField
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Customer Name",
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Menu Category (e.g. Wedding, Office)",
                    prefixIcon: Icon(Icons.restaurant_menu),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Delivery Date",
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Order Notes / Special Request",
                    prefixIcon: Icon(Icons.notes),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 30),
                const Text(
                  "Menu Gallery (Al Haq Kitchen)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // 3. Gallery Grid dibawahnya pakai GridView.count
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildGridItem(
                      color: Colors.orange.shade400,
                      label: "Nasi Briyani",
                    ),
                    _buildGridItem(
                      color: Colors.red.shade400,
                      label: "Rendang Daging",
                    ),
                    _buildGridItem(
                      color: Colors.green.shade600,
                      label: "Bento Box",
                    ),
                    _buildGridItem(
                      color: Colors.amber.shade700,
                      label: "Tumpeng Mini",
                    ),
                    _buildGridItem(
                      color: Colors.brown.shade400,
                      label: "Nasi Liwet",
                    ),
                    _buildGridItem(
                      color: Colors.deepOrange.shade600,
                      label: "Ayam Suwir Pedas",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem({required Color color, required String label}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // 4. Label diatas kotaknya atau gambar pakai Stack
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            shadows: [
              Shadow(blurRadius: 4, color: Colors.black45, offset: Offset(2, 2))
            ]
          ),
        ),
      ],
    );
  }
}