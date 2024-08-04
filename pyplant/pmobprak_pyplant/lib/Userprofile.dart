import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pyplant/Favorit.dart';
import 'package:pyplant/HomePage.dart';
import 'package:pyplant/LoginPage.dart';
import 'package:pyplant/Notifications/Notifications.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const UserAccountApp());
}

class UserAccountApp extends StatelessWidget {
  const UserAccountApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: UserAccountScreen(),
    );
  }
}

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  late User? _user;
  String _userName = '';
  String _userUsername = '';
  List<String> _photoURLs = []; // Store multiple photo URLs
  File? _image;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _loadUserData();
    _loadUserPhotos(); // Load existing user photos
  }

  Future<void> _loadUserData() async {
    // Load user's name and email from Firebase
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _userName = data['name'] ?? '';
          _userUsername = data['username'] ?? '';
        });
      }
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  Future<void> _loadUserPhotos() async {
    // Load user's photos from Firestore
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        if (data.containsKey('photoURLs')) {
          setState(() {
            _photoURLs = List<String>.from(data['photoURLs']);
          });
        }
      }
    } catch (e) {
      print('Error loading user photos: $e');
    }
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

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserAccountApp()),
    );
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  Future<void> _changePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });

      // Upload image to Firebase Storage
      try {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_photos/${_user!.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg');
        await storageRef.putFile(_image!);

        // Get the download URL
        final downloadURL = await storageRef.getDownloadURL();
        print('Image uploaded successfully. Download URL: $downloadURL');

        // Update user's profile with the new photo URL
        _photoURLs.add(downloadURL); // Add new URL to list
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_user!.uid)
            .update({'photoURLs': _photoURLs});

        setState(() {});
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  void _showFullImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.network(imageUrl),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_photoURLs.isNotEmpty) {
                        _showFullImage(context, _photoURLs.last);
                      }
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _photoURLs.isNotEmpty
                          ? NetworkImage(_photoURLs.last)
                          : AssetImage('assets/images/Avatar.png') as ImageProvider,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        _changePhoto(context);
                      },
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                _userName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.red,
                iconSize: 30,
                onPressed: () {
                  _navigateToHistory(context);
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightGreenAccent,
                      Color.fromARGB(255, 176, 248, 158),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text('Email: ${_user?.email ?? ''}'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightGreenAccent,
                      Color.fromARGB(255, 176, 248, 158),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text('Username: $_userUsername'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightGreenAccent,
                      Color.fromARGB(255, 176, 248, 158),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: const Text('Account Creation Date'),
                  subtitle: Text(_user!.metadata.creationTime != null
                      ? '${_user!.metadata.creationTime!.day}-${_user!.metadata.creationTime!.month}-${_user!.metadata.creationTime!.year}'
                      : 'No creation date available'),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _navigateToLogin(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightGreenAccent,
              Color.fromARGB(255, 176, 248, 158),
            ],
          ),
        ),
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
                // Account screen (current screen)
                break;
            }
          },
        ),
      ),
    );
  }
}
