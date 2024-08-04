import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pyplant/admindetail.dart';

class adminview extends StatefulWidget {
  const adminview({Key? key}) : super(key: key);

  @override
  _adminviewState createState() => _adminviewState();
}

class _adminviewState extends State<adminview> {
  late Future<List<QueryDocumentSnapshot>> _fetchContent;

  @override
  void initState() {
    super.initState();
    _fetchContent = _fetchallContent();
  }

  Future<List<QueryDocumentSnapshot>> _fetchallContent() async {
    try {
      // Query Firestore for items with category 'sayur' and growingMedium 'pot'
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'sayur')
          .where('growingMedium', isEqualTo: 'pot')
          .get();

      // Query Firestore for items with category 'sayur' and growingMedium 'tanah'
      QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'sayur')
          .where('growingMedium', isEqualTo: 'tanah')
          .get();

      // Query Firestore for items with category 'sayur' and growingMedium 'hidroponik'
      QuerySnapshot querySnapshot3 = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'sayur')
          .where('growingMedium', isEqualTo: 'hidroponik')
          .get();

      // Query Firestore for items with category 'buah' and growingMedium 'hidroponik'
      QuerySnapshot querySnapshot4 = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'buah')
          .where('growingMedium', isEqualTo: 'hidroponik')
          .get();

      // Query Firestore for items with category 'buah' and growingMedium 'pot'
      QuerySnapshot querySnapshot5 = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'buah')
          .where('growingMedium', isEqualTo: 'pot')
          .get();

      // Query Firestore for items with category 'buah' and growingMedium 'tanah'
      QuerySnapshot querySnapshot6 = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'buah')
          .where('growingMedium', isEqualTo: 'tanah')
          .get();

      // Query Firestore for items with category 'bunga' and growingMedium 'hidroponik'
      QuerySnapshot querySnapshot7 = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'bunga')
          .where('growingMedium', isEqualTo: 'hidroponik')
          .get();

      // Query Firestore for items with category 'bunga' and growingMedium 'pot'
      QuerySnapshot querySnapshot8 = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'bunga')
          .where('growingMedium', isEqualTo: 'pot')
          .get();

      // Query Firestore for items with category 'bunga' and growingMedium 'tanah'
      QuerySnapshot querySnapshot9 = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'bunga')
          .where('growingMedium', isEqualTo: 'tanah')
          .get();

      // Combine results from different queries into one list
      List<QueryDocumentSnapshot> allDocuments = [];
      allDocuments.addAll(querySnapshot.docs);
      allDocuments.addAll(querySnapshot2.docs);
      allDocuments.addAll(querySnapshot3.docs);
      allDocuments.addAll(querySnapshot4.docs);
      allDocuments.addAll(querySnapshot5.docs);
      allDocuments.addAll(querySnapshot6.docs);
      allDocuments.addAll(querySnapshot7.docs);
      allDocuments.addAll(querySnapshot8.docs);
      allDocuments.addAll(querySnapshot9.docs);

      return allDocuments;
    } catch (e) {
      print('Error fetching all content: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Content'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: _fetchContent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75, // Adjust as per your design
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var document = snapshot.data![index];
                var title = document['title'];
                var imageUrl = document['imageUrl'];

                // Check if imageUrl exists, otherwise use a default image or handle as needed
                Widget imageWidget = imageUrl != null
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Placeholder(); // Placeholder or default image widget

                return InkWell(
                  onTap: () {
                    // Navigate to detail page when tapped
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => admindetail(documentId: document.id),
                    ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // AspectRatio to ensure images are the same size
                        AspectRatio(
                          aspectRatio: 1, // Ensures the image is square
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: imageWidget,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
