import 'package:flutter/material.dart';


class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  bool _tampilNama = false;
  bool _isFavorite = false;
  bool _tampilDetail = false;
  bool _isKotakDiklik = false;
  int _angka = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Al-Haq Connect",
          style: TextStyle(color: Color(0xFFbc9c22), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF00357a),
        centerTitle: true, 
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. Kita bikin ElevatedButton atau tombol aksi utama
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _tampilNama = !_tampilNama;
                });
              },
              child: const Text("Check Menu"),
            ),
            if (_tampilNama) Text("1. Bento Box\n2. Nasi Ayam Suwir\n3.Nasi Chicken Briyani", style: const TextStyle(fontSize: 18)),
            const Divider(),

            // 2. Lanjut bikin IconButton atau ikon interaktif
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite),
                  color: _isFavorite ? Colors.red : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                ),
                Text(_isFavorite ? "Suka Banget!!!" : "Suka Al-Haq?"),
              ],
            ),
            const Divider(),

            // 3. Bikin TextButton atau tombol teks sederhana
            TextButton(
              onPressed: () {
                setState(() {
                  _tampilDetail = !_tampilDetail;
                });
              },
              child: const Text("Detail Info"),
            ),
            if (_tampilDetail)
              const Text("Berdiri sejak 2022, Al-Haq Kitchen menyediakan catering untuk berbagai acara dengan menu yang lezat dan harga terjangkau di wilayah khusus Jakarta. Di 2026 ini, kami membuat aplikasi Al-Haq Connect untuk memudahkan pelanggan memesan catering dan mendapatkan informasi terbaru tentang menu dan promo kami. Dan di 2027 mendatang kami akan meluncurkan produk dibawah naungan Al-Haq Kitchen yaitu Fridz, Frozen Food Packaging yang praktis dan higienis untuk kebutuhan sehari-hari Anda dan tersedia di Minimarket terdekat di daerah kalian seperti Alfamart, Indomart dan juga Superindo."),
            const Divider(),

            // 4. Bikin InkWell atau area sentuh dengan efek visual
            InkWell(
              onTap: () {
              print('Kotak berhasil disentuh!');
                setState(() {
                  _isKotakDiklik = !_isKotakDiklik;
                });
              },
              splashColor: const Color(0xFFbc9c22),
              child: Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                child: const Text("Follow Us!"),
              ),
            ),
            if (_isKotakDiklik) const Text("Lets Go!"),
            const Divider(),

            // 5. Bikin GestureDetector
            const Text("Tambah Pesanan:"),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                print("Ditekan sekali");
                setState(() => _angka += 1);
              },
              onDoubleTap: () {
                print("Ditekan dua kali");
                setState(() => _angka += 2);
              },
              onLongPress: () {
                print("Tahan lama");
                setState(() => _angka += 3);
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text("$_angka", style: const TextStyle(fontSize: 40, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            const Text("1. Tap(+1) untuk pesan 1 pax\n2. DoubleTap(+2) untuk 2 pax\n3. Hold(+3) untuk 3 pax sekaligus"),
          ],
        ),
      ),
      // 6. Bikin FAB atau Floating Action Button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          setState(() {
            _angka--;
          });
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}