import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class admindetail extends StatefulWidget {
  final String documentId;

  const admindetail({Key? key, required this.documentId}) : super(key: key);

  @override
  _admindetailState createState() => _admindetailState();
}

class _admindetailState extends State<admindetail> {
  late Future<DocumentSnapshot> _fetchContent;

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _fetchContent = _fetchallContent();

    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<DocumentSnapshot> _fetchallContent() async {
    try {
      // Get document from Firestore based on documentId
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('content')
          .doc(widget.documentId)
          .get();

      // Set initial values to controllers
      _titleController.text = documentSnapshot['title'];
      _contentController.text = documentSnapshot['content'];

      return documentSnapshot;
    } catch (e) {
      print('Error fetching content: $e');
      throw e;
    }
  }

  void _updateContent() async {
    try {
      await FirebaseFirestore.instance
          .collection('content')
          .doc(widget.documentId)
          .update({
        'title': _titleController.text,
        'content': _contentController.text,
        // Add other fields if needed
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Content updated successfully')),
      );
    } catch (e) {
      print('Error updating content: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update content')),
      );
    }
  }

  void _deleteContent() async {
    try {
      await FirebaseFirestore.instance
          .collection('content')
          .doc(widget.documentId)
          .delete();
      // Navigate back or show success message
      Navigator.of(context).pop();
    } catch (e) {
      print('Error deleting content: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete content')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PyPlant'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteContent,
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _updateContent,
          ),
        ],
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
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _contentController,
                    decoration: InputDecoration(
                      labelText: 'Content',
                    ),
                    maxLines: null, // Allow multiple lines
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
