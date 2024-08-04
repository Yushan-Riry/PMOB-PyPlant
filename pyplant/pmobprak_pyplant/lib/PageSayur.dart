import 'package:flutter/material.dart';
import 'package:pyplant/Sayur/Hidroponik/Sayur1.dart';
import 'package:pyplant/Sayur/Pot/Sayur2.dart';
import 'package:pyplant/Sayur/Tanah/Sayur3.dart';
import 'package:pyplant/Favorit.dart';
import 'package:pyplant/HomePage.dart';
import 'package:pyplant/Notifications/Notifications.dart';
import 'package:pyplant/Userprofile.dart';


void main() {
  runApp(const Sayur());
}

class Sayur extends StatefulWidget {
  const Sayur({Key? key}) : super(key: key);

  @override
  State<Sayur> createState() => _SayurState();
}

class _SayurState extends State<Sayur> {
  // List untuk menyimpan judul-judul dari setiap item
  final List<String> _itemTitles = [
    'Hidroponik',
    'Pot',
    'Tanah',
  ];

  // List untuk menyimpan rute halaman
  final List<Widget> _pages = [
    const Sayur1(),
    const Sayur2(),
    const Sayur3(),
  ];

  final List<String> _imagePaths = [
    'assets/images/Hidroponik.jpg',
    'assets/images/Pot.jpg',
    'assets/images/Tanah.jpg',
  ];

  // Fungsi untuk menavigasi ke halaman baru
  void _navigateToPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void _navigateToHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Favorit()),
    );
  }

  void _navigateToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Notifications()),
    );
  }

 void _navigateToAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserAccountApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Media Tanam Sayur',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _itemTitles.length,
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
                              aspectRatio: 40 / 9,
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
        bottomNavigationBar: Container(
          color: Colors.green,
          height: 45,
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
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.thumb_up),
                label: 'Favorit',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
            onTap: (int index) {
              switch (index) {
                case 0:
                  _navigateToHome(context);
                  break;
                case 1:
                  _navigateToHistory(context);
                  break;
                case 2:
                  _navigateToNotifications(context);
                  break;
                case 3:
                  _navigateToAccount(context);
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
