// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserPage extends StatelessWidget {
//   final String category;

//   const UserPage({Key? key, required this.category}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$category'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('content')
//             .where('category', isEqualTo: category)
//             .orderBy('timestamp', descending: true)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No content available'));
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (BuildContext context, int index) {
//               DocumentSnapshot doc = snapshot.data!.docs[index];
//               return Card(
//                 margin: EdgeInsets.all(8.0),
//                 child: ListTile(
//                   title: Text(doc['title']),
//                   subtitle: Text(doc['content']),
//                   trailing: Image.network(doc['imageUrl']),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
