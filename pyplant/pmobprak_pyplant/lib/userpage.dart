// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:pyplant/database_service.dart';
// import 'package:pyplant/firebase_options.dart';
// import 'package:pyplant/users.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const userPage());
// } 

// class userPage extends StatefulWidget {
//   const userPage({super.key});

//   @override
//   State<userPage> createState() => _userPageState();

// }

//   class _userPageState extends State<userPage> {

//     final TextEditingController _textEditingController = TextEditingController();

//     final DatabaseService _databaseService = DatabaseService();

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _appBar(),
//         body: _buildUI(),
//         floatingActionButton: FloatingActionButton(onPressed: _displayTextInputDialog,  backgroundColor: Theme.of(context).colorScheme.primary,
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         )
//         ),
//       );
//     }

//     PreferredSizeWidget _appBar() {
//       return AppBar(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         title: const Text(
//           "User",
//           style: TextStyle(color: Colors.white,
//           )
//         )
//       );
//     }

//   Widget _buildUI() {
//     return SafeArea(
//       child: Column(
//         children: [
//         _messagesListView(), 
//         ],));
//   }

//   Widget _messagesListView() {
//     return SizedBox(
//       height: MediaQuery.sizeOf(context).height * 0.80,
//       width: MediaQuery.sizeOf(context).width, 
//       child: StreamBuilder(
//         stream : _databaseService.getUsers(),
//         builder: (context, snapshot) {
//           List users = snapshot.data?.docs ?? [];
//           if (users.isEmpty) {
//             return const Center(
//               child : Text("Add a user!"),
//             );
//           }
//           return ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               Users user = users[index].data();
//               String userId = users[index].id;
//             return Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 10,
//                 horizontal: 10,
//               ),
//               child: ListTile(
//                 tileColor: Theme.of(context).colorScheme.primaryContainer,
//                 title: Text(user.Name),
//                 subtitle: Text(user.email),
//                 onLongPress: () {
//                   _databaseService.deleteusers(userId);
//                 } ,
//               ),
//             );
//           }); 
//         },
//       )
//     );
//   }

//   void _displayTextInputDialog() async {
//     return showDialog(
//       context: context, 
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add a user'),
//           content: TextField(
//             controller: _textEditingController,
//             decoration: const InputDecoration(hintText: 'User....'),
//           ),
//           actions: <Widget>[
//             MaterialButton(color: Theme.of(context).colorScheme.primary, 
//             textColor: Colors.white,
//             child: const Text('Ok'),
//             onPressed: (){
//              Navigator.pop(context);
//              _textEditingController.clear();
//             },
//             ),
//           ],
//         );
//       },
//    );
//   }
// }

