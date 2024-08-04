import 'package:flutter/material.dart';
import 'package:pyplant/HomePage.dart';
import 'package:pyplant/Notifications/Notifications.dart';
import 'package:pyplant/Userprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import firestore
import 'package:firebase_auth/firebase_auth.dart';


class Favorit extends StatelessWidget {
  const Favorit({Key? key}) : super(key: key);

  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel Favorit'),
      ),
      body: FavoritPage(), // Tampilkan halaman favorit di bagian body
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
    );
  }
}

// Function to fetch liked articles
Future<List<DocumentSnapshot>> getLikedArticles() async {
  // Get the current user's UID
  String userId = FirebaseAuth.instance.currentUser!.uid;

  // Fetch liked articles from Firestore
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('users-fav-items')
      .doc(userId)
      .collection('items')
      .get();

  // Return the list of liked articles
  return querySnapshot.docs;
}

class FavoritPage extends StatefulWidget {
  const FavoritPage({Key? key}) : super(key: key);

  @override
  _FavoritPageState createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  late Future<List<DocumentSnapshot>> _likedArticles;

  @override
  void initState() {
    super.initState();
    _likedArticles = getLikedArticles();
  }

  Future<void> _removeFromFavorites(String itemId) async {
    // Get the current user's UID
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Remove the article from Firestore
    await FirebaseFirestore.instance
        .collection('users-fav-items')
        .doc(userId)
        .collection('items')
        .doc(itemId)
        .delete();

    // Update the UI by reloading the list of liked articles
    setState(() {
      _likedArticles = getLikedArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: _likedArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading liked articles'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No liked articles'));
        }

        List<DocumentSnapshot> likedArticles = snapshot.data!;
        return ListView.builder(
          itemCount: likedArticles.length,
          itemBuilder: (context, index) {
            DocumentSnapshot article = likedArticles[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      article['title'],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.thumb_down),
                      onPressed: () {
                        _removeFromFavorites(article.id); // Remove the article from favorites
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
