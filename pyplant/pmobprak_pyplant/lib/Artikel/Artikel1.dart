import 'package:flutter/material.dart';

class Artikel1 extends StatelessWidget {
  const Artikel1({super.key, Key? keyy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apa itu Tanaman Hidroponik'),
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
               'assets/images/Artikel1.jpg',
               width : 5000,
               height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tanaman Hidroponik: Pertanian Modern Tanpa Tanah',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tanaman hidroponik telah menjadi metode yang semakin populer dalam bercocok tanam. Mengutamakan air sebagai media tanamnya, metode ini telah merevolusi cara kita memandang pertanian. Berbeda dengan pertanian konvensional yang bergantung pada tanah, hidroponik memungkinkan pertumbuhan tanaman tanpa menggunakan tanah sama sekali.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Apa Itu Tanaman Hidroponik?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tanaman hidroponik adalah jenis pertanian yang menggunakan air sebagai media utama untuk pertumbuhan tanaman, dengan memberikan nutrisi yang diperlukan secara langsung ke akar tanaman. Secara harfiah, "hidroponik" berasal dari bahasa Yunani yang berarti "air" (hidro) dan "bekerja" (ponos). Metode ini telah digunakan sejak zaman kuno oleh peradaban seperti bangsa Mesir kuno, namun baru-baru ini menjadi semakin populer di kalangan petani modern dan hobiis pertanian.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Bagaimana Tanaman Hidroponik Bekerja?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tanaman hidroponik menghilangkan ketergantungan pada tanah sebagai media pertumbuhan. Sebagai gantinya, nutrisi yang diperlukan tanaman dilarutkan dalam air, dan akar tanaman dibiarkan terendam di dalam larutan nutrisi tersebut. Sistem ini memungkinkan tanaman untuk secara efisien menyerap nutrisi yang diperlukan, sehingga memungkinkan pertumbuhan yang lebih cepat dan hasil yang lebih baik.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Keuntungan Tanaman Hidroponik',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '1. Penggunaan Air yang Efisien: Tanaman hidroponik menggunakan sekitar 10% dari jumlah air yang biasanya digunakan dalam pertanian konvensional.\n2. Pertumbuhan Lebih Cepat: Tanaman hidroponik tumbuh lebih cepat karena nutrisi langsung tersedia untuk akar tanaman.\n3. Pengendalian Lingkungan: Lingkungan tumbuh tanaman hidroponik dapat dikontrol dengan lebih baik, termasuk suhu, kelembaban, dan tingkat nutrisi.\n4. Tidak Memerlukan Tanah: Tanaman hidroponik dapat ditanam di mana saja tanpa memerlukan tanah yang subur, membuatnya ideal untuk daerah perkotaan atau ruang terbatas.',
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
              'Tanaman hidroponik merupakan inovasi dalam dunia pertanian yang menawarkan solusi yang efisien dan berkelanjutan untuk bercocok tanam. Dengan memanfaatkan air sebagai media tanam utama, metode ini telah membuka pintu bagi pertanian di tempat-tempat yang sebelumnya dianggap tidak mungkin untuk ditanami. Dengan lebih banyaknya penelitian dan pengembangan di bidang ini, masa depan pertanian hidroponik terlihat cerah dalam memenuhi tuntutan pertumbuhan populasi global sambil menjaga lingkungan.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
