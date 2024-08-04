import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sayur1Detail extends StatefulWidget {
  final String documentId;

  const Sayur1Detail({Key? key, required this.documentId})
      : super(key: key);

  @override
  _Sayur1Detail createState() =>
      _Sayur1Detail();
}

class _Sayur1Detail extends State<Sayur1Detail> {
  late Future<DocumentSnapshot> _fetchContent;

  @override
  void initState() {
    super.initState();
    _fetchContent = _fetchSayurHidroponikContent();
  }

  Future<DocumentSnapshot> _fetchSayurHidroponikContent() async {
    try {
      // Get document from Firestore based on documentId
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('content')
          .doc(widget.documentId)
          .get();

      return documentSnapshot;
    } catch (e) {
      print('Error fetching content: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PyPlant'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _fetchContent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(child: Text('No data available'));
          } else {
            var document = snapshot.data!;
            var title = document['title'];
            var content = document['content'];
            var imageUrl = document['imageUrl'];

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 200, // Adjust height as per your design
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    content,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
