import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pyplant/Artikel/Artikel1.dart';
import 'package:pyplant/Artikel/Artikel2.dart';
import 'package:pyplant/Artikel/Artikel3.dart';
import 'package:pyplant/Artikel/Artikel4.dart';
import 'package:pyplant/Artikel/Artikel5.dart';
import 'package:pyplant/Favorit.dart';
import 'package:pyplant/Notifications/Notifications.dart';
import 'package:pyplant/PageBuah.dart';
import 'package:pyplant/PageBunga.dart';
import 'package:pyplant/PageSayur.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pyplant/Userprofile.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<bool> _isFavorite = List.generate(5, (index) => false);

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  // Fungsi untuk memuat artikel favorit dari Firestore
  Future<void> _loadFavorites() async {
    var currentUser = _auth.currentUser;
    if (currentUser != null) {
      var snapshot = await FirebaseFirestore.instance
          .collection("users-fav-items")
          .doc(currentUser.uid)
          .collection("items")
          .get();
      
      List<String> likedTitles = snapshot.docs.map((doc) => doc.id).toList();
      setState(() {
        _isFavorite = _itemTitles.map((title) => likedTitles.contains(title)).toList();
      });
    }
  }

  // Fungsi untuk menambahkan artikel favorit ke Firestore
  Future<void> _addToFavorites(int index) async {
    var currentUser = _auth.currentUser;
    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection("users-fav-items")
          .doc(currentUser.uid)
          .collection("items")
          .doc(_itemTitles[index])
          .set({
        'title': _itemTitles[index],
        'image': _imagePaths[index],
      });
    }
  }

  // Fungsi untuk menghapus artikel favorit dari Firestore
  Future<void> _removeFromFavorites(int index) async {
    var currentUser = _auth.currentUser;
    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection("users-fav-items")
          .doc(currentUser.uid)
          .collection("items")
          .doc(_itemTitles[index])
          .delete();
    }
  }

  Future<void> _toggleFavorite(int index) async {
    var currentUser = _auth.currentUser;
    if (currentUser != null) {
      if (_isFavorite[index]) {
        // Hapus dari favorit
        await _removeFromFavorites(index);
      } else {
        // Tambahkan ke favorit
        await _addToFavorites(index);
      }

      setState(() {
        _isFavorite[index] = !_isFavorite[index];
      });
    }
  }

  final List<String> _itemTitles = [
    'Apa itu Tanaman Hidroponik?',
    'Mengenal jenis - jenis Pupuk',
    'Pengaruh Cuaca Terhadap Tanaman',
    'Manfaat Buah bagi Kesehatan',
    'Tips & Trik Merawat Sayur!',
  ];

  // List untuk menyimpan rute halaman
  List<Widget> pages = [
    const Artikel1(),
    const Artikel2(),
    const Artikel3(),
    const Artikel4(),
    const Artikel5(),
  ];

  final List<String> _imagePaths = [
    'assets/images/Artikel1.jpg',
    'assets/images/Artikel2.jpg',
    'assets/images/Artikel3.jpg',
    'assets/images/Artikel4.jpg',
    'assets/images/Artikel5.jpg',
  ];

  // Fungsi untuk menavigasi ke halaman baru
  void _navigateToPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pages[index]),
    );
  }

  // Fungsi untuk menavigasi ke halaman Sayur
  void _navigateToSayur() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Sayur()),
    );
  }

  // Fungsi untuk menavigasi ke halaman Buah
  void _navigateToBuah() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Buah()),
    );
  }

  // Fungsi untuk menavigasi ke halaman Bunga
  void _navigateToBunga() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Bunga()),
    );
  }

  // Fungsi untuk menavigasi ke halaman Home
  void _navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  // Fungsi untuk menavigasi ke halaman History
  void _navigateToHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Favorit()),
    );
  }

  // Fungsi untuk menavigasi ke halaman Notifications
  void _navigateToNotifications() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Notifications()),
    );
  }

  // Fungsi untuk menavigasi ke halaman Account
  void _navigateToAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserAccountApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(1),
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.lightGreen,
                      Color.fromARGB(255, 176, 248, 158),
                    ]),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Stack(
                    children: [
                      Positioned(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/images/logo.png', // Ganti dengan path logo Anda
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                SizedBox(
                  width: constraints.maxWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 15),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20), // 70 adalah setengah dari lebar gambar
                          child: Image.asset(
                            'assets/images/Gambar.jpg',
                            width: 3000, // Ukuran gambar (disesuaikan dengan kebutuhan)
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        ' Menu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  color: Colors.green.withOpacity(0.5),
                                ),
                              ),
                              const Positioned(
                                top: 9,
                                left: 40,
                                right: 0,
                                child: Text(
                                  'Sayur',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: -35,
                                right: 10,
                                child: InkWell(
                                  onTap: _navigateToSayur, // Pindah ke halaman Sayur
                                  child: Image.asset(
                                    'assets/images/sayur.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  color: Colors.red.withOpacity(0.4),
                                ),
                              ),
                              const Positioned(
                                top: 9,
                                left: 40,
                                right: 0,
                                child: Text(
                                  'Buah',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: -35,
                                right: 10,
                                child: InkWell(
                                  onTap: _navigateToBuah, // Pindah ke halaman Buah
                                  child: Image.asset(
                                    'assets/images/buah.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  color: Colors.purple.withOpacity(0.4),
                                ),
                              ),
                              const Positioned(
                                top: 9,
                                left: 40,
                                right: 0,
                                child: Text(
                                  'Bunga',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: -40,
                                right: 10,
                                child: InkWell(
                                  onTap: _navigateToBunga, // Pindah ke halaman Bunga
                                  child: Image.asset(
                                    'assets/images/bunga.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        ' Artikel',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () {
                                  _navigateToPage(index); // Pindah ke halaman artikel
                                },
                                child: Card(
                                  elevation: 5, // Tinggi shadow Card
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      AspectRatio(
                                        aspectRatio: 32 / 9,
                                        child: Image.asset(
                                          _imagePaths[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          _itemTitles[index],
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(
                                            _isFavorite[index] ? Icons.favorite : Icons.favorite_border,
                                            color: _isFavorite[index] ? Colors.red : Colors.grey,
                                          ),
                                          onPressed: () {
                                            _toggleFavorite(index);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.green, // Atur warna latar belakang
        height: 45, // Atur tinggi sesuai kebutuhan Anda
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Icon home
              label: 'Home', // Label untuk item home
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up), // Icon history
              label: 'Favorit', // Label untuk item history
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications), // Icon bell
              label: 'Notifications', // Label untuk item notifications
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), // Icon account
              label: 'Account', // Label untuk item account
            ),
          ],
          onTap: (int index) {
            switch (index) {
              case 0:
                _navigateToHome(); // Pindah ke halaman Home
                break;
              case 1:
                _navigateToHistory(); // Pindah ke halaman History
                break;
              case 2:
                _navigateToNotifications(); // Pindah ke halaman Notifications
                break;
              case 3:
                _navigateToAccount(); // Pindah ke halaman Account
                break;
            }
          },
        ),
      ),
    );
  }
}
