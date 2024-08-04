import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Buah2Detail extends StatefulWidget {
  final String documentId;

  const Buah2Detail({Key? key, required this.documentId})
      : super(key: key);

  @override
  _Buah2Detail createState() =>
      _Buah2Detail();
}

class _Buah2Detail extends State<Buah2Detail> {
  late Future<DocumentSnapshot> _fetchContent;

  @override
  void initState() {
    super.initState();
    _fetchContent = _fetchBuahPotContent();
  }

  Future<DocumentSnapshot> _fetchBuahPotContent() async {
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
