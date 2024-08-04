import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pyplant/Bunga/Pot/Bunga2Detail.dart'; // Import halaman detail

class Bunga2 extends StatefulWidget {
  const Bunga2({Key? key}) : super(key: key);

  @override
  _Bunga2State createState() => _Bunga2State();
}

class _Bunga2State extends State<Bunga2> {
  late Future<List<DocumentSnapshot>> _fetchContent;

  @override
  void initState() {
    super.initState();
    _fetchContent = _fetchBungaPotContent();
  }

  Future<List<DocumentSnapshot>> _fetchBungaPotContent() async {
    try {
      // Query Firestore for items with category 'Bunga' and growingMedium 'Pot'
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('content')
          .where('category', isEqualTo: 'bunga')
          .where('growingMedium', isEqualTo: 'pot')
          .get();

      return querySnapshot.docs;
    } catch (e) {
      print('Error fetching content: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bunga Pot'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
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

                return InkWell(
                  onTap: () {
                    // Navigate to detail page when tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bunga2Detail(documentId: document.id),
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
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
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