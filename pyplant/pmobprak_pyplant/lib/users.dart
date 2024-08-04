
// class Users {
//   String Username;
//   String Password;
//   String Name;
//   String email;

//   Users({
//     required this.Username,
//     required this.Password,
//     required this.Name,
//     required this.email,
//   });

//   Users.fromJson(Map<String, Object?> json) 
//   : this(Username: json['Username']! as String, 
//           Password: json['Password']! as String, 
//           Name: json['Name']! as String,
//           email: json['email']! as String,                                          
//         );

//   Users copyWith({
//     String? Username,
//     String? Password,
//     String? email,
//     String? Name,
//   }) {
//     return Users(Username: Username ?? this.Username, 
//                   Password: Password ?? this.Password, 
//                   email: email ?? this.email,
//                   Name: Name ?? this.Name);

//   }
//   Map<String, Object?> toJson(){
//     return {
//     'Username' : Username,
//     'Password' : Password,
//     'Name' : Name,
//     'email' : email,
//     };
//   }
// }