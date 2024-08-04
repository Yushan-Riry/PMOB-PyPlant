import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pyplant/Favorit.dart';
import 'package:pyplant/HomePage.dart';
import 'package:pyplant/Userprofile.dart';

void main() {
  runApp(const Notifications());
}

class Activity {
  String id; // ID unik aktivitas di Firestore
  final String title;
  bool isCompleted;

  Activity({required this.id, required this.title, this.isCompleted = false});
}

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController _activityController = TextEditingController();
  List<Activity> _activities = [];
  bool _isActivityNameValid = false;

  String? _uid; // Variabel untuk menyimpan UID pengguna saat ini

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  // Mendapatkan UID pengguna saat ini
  void _getUser() {
    if (_auth.currentUser != null) {
      setState(() {
        _uid = _auth.currentUser!.uid;
        _getActivities();
      });
    }
  }

  void _validateActivityName(String value) {
    setState(() {
      _isActivityNameValid = value.isNotEmpty;
    });
  }

  Future<void> _saveActivity() async {
    if (_isActivityNameValid && _uid != null) {
      final newActivity = Activity(id: '', title: _activityController.text);

      try {
        // Tambahkan aktivitas ke Firestore
        DocumentReference docRef = await _firestore.collection('users').doc(_uid).collection('activities').add({
          'title': newActivity.title,
          'isCompleted': newActivity.isCompleted,
        });

        newActivity.id = docRef.id;

        setState(() {
          _activities.add(newActivity);
        });
        _activityController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Activity added successfully')),
        );
      } catch (e) {
        print('Error saving activity: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save activity')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter activity name')),
      );
    }
  }

  Future<void> _getActivities() async {
    if (_uid != null) {
      try {
        // Ambil daftar aktivitas dari Firestore
        QuerySnapshot querySnapshot = await _firestore.collection('users').doc(_uid).collection('activities').get();

        setState(() {
          _activities = querySnapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Activity(
              id: doc.id,
              title: data['title'],
              isCompleted: data['isCompleted'] ?? false,
            );
          }).toList();
        });
      } catch (e) {
        print('Error getting activities: $e');
      }
    }
  }

  void _toggleActivity(int index) async {
    try {
      // Toggle status isCompleted di Firestore
      await _firestore.collection('users').doc(_uid).collection('activities').doc(_activities[index].id).update({
        'isCompleted': !_activities[index].isCompleted,
      });

      setState(() {
        _activities[index].isCompleted = !_activities[index].isCompleted;
      });
    } catch (e) {
      print('Error toggling activity: $e');
    }
  }

  void _deleteActivity(int index) async {
    try {
      // Hapus aktivitas dari Firestore
      await _firestore.collection('users').doc(_uid).collection('activities').doc(_activities[index].id).delete();

      setState(() {
        _activities.removeAt(index);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Activity deleted successfully')),
      );
    } catch (e) {
      print('Error deleting activity: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete activity')),
      );
    }
  }

  void _signOut() async {
    await _auth.signOut();
    Navigator.pop(context);
  }

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

  void _navigateToFavorit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Favorit()),
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add an Activity',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _activityController,
                      onChanged: _validateActivityName,
                      decoration: InputDecoration(
                        labelText: 'Activity Name',
                        errorText: _isActivityNameValid ? null : 'Please enter activity name',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () => _saveActivity(),
                    icon: Icon(Icons.save),
                    tooltip: 'Save Activity',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Activity List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _activities.length,
                  itemBuilder: (context, index) {
                    final activity = _activities[index];
                    return ListTile(
                      leading: Checkbox(
                        value: activity.isCompleted,
                        onChanged: (_) => _toggleActivity(index),
                      ),
                      title: Text(
                        activity.title,
                        style: TextStyle(
                          decoration: activity.isCompleted ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Show delete confirmation dialog
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Delete Activity?'),
                              content: Text('Are you sure you want to delete this activity?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _deleteActivity(index);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
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
                icon: Icon(Icons.thumb_up), // Icon Favorit
                label: 'Favorit', // Label untuk item Favorit
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
                  _navigateToHome(context); // Pindah ke halaman Home
                  break;
                case 1:
                  _navigateToFavorit(context);
                  break;
                case 2:
                  _navigateToNotifications(context); // Pindah ke halaman Notifications
                  break;
                case 3:
                  _navigateToAccount(context); // Pindah ke halaman Account
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}

