import 'package:flutter/material.dart';

class Artikel4 extends StatelessWidget {
  const Artikel4({super.key, Key? keyy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manfaat Buah bagi Kesehatan'),
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
              'assets/images/Artikel4.jpg',
              width: 5000,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Manfaat Buah bagi Kesehatan',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Buah-buahan merupakan sumber nutrisi penting yang kaya akan vitamin, mineral, serat, dan antioksidan. Konsumsi buah secara teratur dapat memberikan berbagai manfaat bagi kesehatan tubuh, antara lain:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '1. Meningkatkan Sistem Kekebalan Tubuh',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Buah-buahan mengandung vitamin C dan antioksidan yang dapat membantu meningkatkan sistem kekebalan tubuh dan melindungi tubuh dari serangan penyakit.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '2. Menjaga Kesehatan Jantung',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Serat dan antioksidan dalam buah-buahan dapat membantu menurunkan kadar kolesterol jahat dalam darah dan mengurangi risiko penyakit jantung.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '3. Meningkatkan Pencernaan',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Kandungan serat dalam buah-buahan dapat membantu memperlancar pencernaan dan mencegah sembelit serta masalah pencernaan lainnya.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '4. Menjaga Berat Badan Ideal',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Buah-buahan umumnya rendah kalori namun tinggi serat, sehingga dapat membantu mengontrol nafsu makan dan menjaga berat badan ideal.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '5. Mencegah Penyakit Kronis',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Konsumsi buah-buahan secara teratur dapat membantu mengurangi risiko terkena penyakit kronis seperti diabetes, kanker, dan penyakit degeneratif lainnya.',
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
              'Buah-buahan merupakan bagian penting dari pola makan sehat dan seimbang. Dengan mengonsumsi berbagai jenis buah secara teratur, kita dapat mendapatkan berbagai manfaat kesehatan yang penting untuk menjaga tubuh tetap sehat dan bugar.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}


