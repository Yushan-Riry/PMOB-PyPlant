import 'package:flutter/material.dart';

class Artikel2 extends StatelessWidget {
  const Artikel2({super.key, Key? keyy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mengenal Jenis-Jenis Pupuk'),
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
              'assets/images/Artikel2.jpg',
              width: 5000,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Mengenal Jenis-Jenis Pupuk',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Pupuk adalah salah satu elemen penting dalam budidaya tanaman yang bertujuan untuk menyediakan nutrisi yang diperlukan bagi tanaman. Jenis-jenis pupuk bermacam-macam, dan setiap jenis memiliki kegunaan dan manfaatnya masing-masing. Pemilihan jenis pupuk yang tepat sangat penting dalam budidaya tanaman. Dengan mengenal jenis-jenis pupuk yang ada serta manfaat dan kegunaannya, petani dapat meningkatkan produktivitas tanaman dan menghasilkan hasil panen yang berkualitas.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '1. Pupuk Organik',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Pupuk organik berasal dari bahan-bahan organik alami seperti kompos, pupuk kandang, limbah tanaman, dan sebagainya. Pupuk organik kaya akan unsur hara dan mikroorganisme yang bermanfaat bagi tanaman. Keunggulan pupuk organik antara lain meningkatkan kesuburan tanah, meningkatkan struktur tanah, serta meningkatkan daya tahan tanaman terhadap penyakit dan hama.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '2. Pupuk Anorganik',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Pupuk anorganik, atau sering disebut pupuk kimia, dibuat dari bahan-bahan sintetis seperti amonium nitrat, urea, dan fosfat. Pupuk anorganik umumnya memiliki kandungan nutrisi yang lebih tinggi daripada pupuk organik, namun kurang ramah lingkungan dan dapat mengakibatkan penurunan kualitas tanah dalam jangka panjang.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '3. Pupuk NPK',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Pupuk NPK adalah pupuk yang mengandung tiga unsur hara utama, yaitu nitrogen (N), fosfor (P), dan kalium (K). Pupuk ini sangat penting untuk pertumbuhan tanaman karena menyediakan nutrisi esensial yang dibutuhkan dalam jumlah besar. Pupuk NPK tersedia dalam berbagai komposisi sesuai dengan kebutuhan tanaman yang akan ditanam. Komposisi pupuk NPK biasanya ditandai dengan tiga angka yang menunjukkan persentase kandungan masing-masing unsur hara, seperti 15-15-15 atau 10-10-20. Misalnya, pupuk NPK dengan komposisi 15-15-15 berarti mengandung 15% nitrogen, 15% fosfor, dan 15% kalium.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '4. Pupuk Majemuk',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Pupuk majemuk adalah pupuk yang mengandung lebih dari satu unsur hara tanaman. Biasanya, pupuk majemuk mengandung nitrogen, fosfor, dan kalium, tetapi bisa juga mengandung unsur hara lain seperti kalsium, magnesium, dan belerang. Pupuk majemuk dapat meningkatkan produktivitas tanaman dengan menyediakan nutrisi yang lengkap dan seimbang.',
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
              'Pemilihan jenis pupuk yang tepat sangat penting dalam budidaya tanaman. Dengan mengenal jenis-jenis pupuk yang ada serta manfaat dan kegunaannya, petani dapat meningkatkan produktivitas tanaman dan menghasilkan hasil panen yang berkualitas. Penting untuk memperhatikan dosis dan cara penggunaan pupuk agar tidak terjadi overdosis atau pencemaran lingkungan. Selain itu, pemilihan pupuk juga harus disesuaikan dengan jenis tanaman, kondisi tanah, dan kebutuhan nutrisi tanaman tersebut. Dengan demikian, budidaya tanaman dapat dilakukan secara berkelanjutan dan ramah lingkungan, sehingga mampu mendukung ketahanan pangan dan kesejahteraan petani serta masyarakat secara luas.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
