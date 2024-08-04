import 'package:flutter/material.dart';

class Artikel5 extends StatelessWidget {
  const Artikel5({super.key, Key? keyy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips & Trik Merawat Sayur'),
        backgroundColor: Colors.green,
        // Tambahkan tombol kembali di AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya (homepage)
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/Artikel5.jpg',
              width: 5000,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tips & Trik Merawat Sayur',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Merawat sayuran di rumah membutuhkan perhatian khusus agar tetap segar dan terhindar dari pembusukan. Berikut adalah beberapa tips dan trik yang dapat Anda terapkan untuk merawat sayur dengan baik:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '1. Simpan di Tempat yang Sejuk dan Kering',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Sayuran cenderung cepat busuk jika disimpan di tempat yang lembap. Pastikan untuk menyimpannya di tempat yang sejuk dan kering, seperti dalam kulkas atau ruang penyimpanan yang terpisah.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '2. Hindari Menyimpan Bersama Buah yang Matang',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Buah matang menghasilkan gas etilen yang dapat mempercepat pembusukan sayuran. Hindari menyimpan sayuran bersama buah matang seperti pisang atau apel.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '3. Periksa dan Buang Bagian yang Busuk',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Secara rutin periksa sayuran Anda untuk menemukan bagian yang sudah mulai busuk. Buang bagian tersebut agar tidak mempengaruhi kesegaran sayuran lainnya.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '4. Gunakan Wadah Penyimpanan yang Sesuai',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Pilihlah wadah penyimpanan yang sesuai untuk setiap jenis sayuran. Beberapa sayuran mungkin lebih baik disimpan dalam wadah tertutup, sementara yang lain dapat disimpan dengan sedikit air di dalamnya.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '5. Gunakan Sayuran Sesegera Mungkin',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Sayuran terbaik dikonsumsi dalam waktu sesegera mungkin setelah dipanen. Cobalah untuk menggunakan sayuran dalam waktu beberapa hari setelah dibeli atau dipanen untuk mendapatkan kualitas terbaik.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Kesimpulan',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Merawat sayuran dengan baik dapat membantu Anda mempertahankan kualitas dan kesegaran sayuran lebih lama. Dengan menerapkan tips dan trik ini, Anda dapat menikmati sayuran yang lebih segar dan bergizi setiap saat.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
