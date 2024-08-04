// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:pyplant/users.dart';

// const String USERS_COLLECTION_REF = 'users';

// class DatabaseService {
//   final _firestore = FirebaseFirestore.instance;

//   late final CollectionReference _usersRef;

//   DatabaseService(){
//     _usersRef = _firestore.collection(USERS_COLLECTION_REF).withConverter<Users>
//     (fromFirestore: (snapshots, _) => Users.fromJson(
//       snapshots.data()!,), 
//       toFirestore: (users, _) => users.toJson());
//   }

//   Stream<QuerySnapshot> getUsers(){
//     return _usersRef.snapshots();
//   }

//   void addUsers (Users users) async {
//     _usersRef.add(users);
//   }
//   void deleteusers(String userId) {
//     _usersRef.doc(userId).delete();
//   }
// }