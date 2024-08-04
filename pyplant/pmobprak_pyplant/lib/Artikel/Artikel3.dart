import 'package:flutter/material.dart';

class Artikel3 extends StatelessWidget {
  const Artikel3({super.key, Key? keyy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaruh Cuaca Terhadap Tanaman'),
        backgroundColor: Colors.green,
        // Add a back button in the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page (homepage)
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/Artikel3.jpg',
              width: 5000,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Pengaruh Cuaca Terhadap Tanaman',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Cuaca memiliki peran yang sangat penting dalam pertumbuhan dan produksi tanaman. Berbagai faktor cuaca seperti suhu, kelembaban udara, curah hujan, dan intensitas cahaya matahari dapat memengaruhi proses fotosintesis, respirasi, dan perkembangan tanaman. Pengetahuan tentang pengaruh cuaca terhadap tanaman sangat diperlukan bagi para petani untuk mengoptimalkan hasil panen dan mencegah kerugian akibat kondisi cuaca yang tidak menguntungkan.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '1. Suhu Udara',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Suhu udara yang tepat sangat penting untuk pertumbuhan tanaman. Tanaman memerlukan suhu yang sesuai untuk proses fotosintesis dan metabolisme yang optimal. Suhu udara yang terlalu tinggi atau terlalu rendah dapat menghambat pertumbuhan dan mengakibatkan kerusakan pada tanaman.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '2. Kelembaban Udara',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Kelembaban udara juga memengaruhi pertumbuhan tanaman. Tanaman memerlukan kelembaban udara yang cukup untuk proses transpirasi dan penyerapan nutrisi. Kelembaban udara yang rendah dapat mengakibatkan tanaman layu dan mengurangi produktivitas.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '3. Curah Hujan',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Curah hujan yang cukup penting untuk menyediakan air yang dibutuhkan tanaman. Namun, curah hujan yang berlebihan dapat menyebabkan banjir dan erosi tanah yang merusak tanaman. Di sisi lain, kekurangan curah hujan dapat mengakibatkan kekeringan dan mengganggu pertumbuhan tanaman.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '4. Intensitas Cahaya Matahari',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tanaman memerlukan cahaya matahari untuk proses fotosintesis. Intensitas cahaya matahari yang cukup penting untuk pertumbuhan tanaman yang optimal. Kurangnya cahaya matahari dapat mengakibatkan pertumbuhan yang lambat dan tanaman menjadi leggy.',
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
              'Pengaruh cuaca terhadap tanaman sangat besar dan memengaruhi berbagai aspek kehidupan tanaman. Pengetahuan tentang pengaruh cuaca yang tepat dapat membantu petani mengoptimalkan pertumbuhan tanaman dan meningkatkan hasil panen. Penting bagi petani untuk memantau kondisi cuaca dan mengambil tindakan yang sesuai untuk melindungi tanaman dari kondisi cuaca yang tidak menguntungkan.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
